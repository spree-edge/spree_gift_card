# frozen_string_literal: true

module SpreeGiftCard
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_gift_card\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/spree_gift_card\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css',
                         " *= require spree/frontend/spree_gift_card\n", before: %r{\*/}, verbose: true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css',
                         " *= require spree/backend/spree_gift_card\n", before: %r{\*/}, verbose: true
      end

      def add_schedule
        create_file 'config/schedule.rb' unless File.exist?('config/schedule.rb')
        append_file 'config/schedule.rb' do
          "\nevery 1.day, at: '9:00 am' do\n  runner 'SpreeGiftCard::SentEmailJob.perform_later'\nend\n"
        end
      end

      def add_migrations
        run 'rake railties:install:migrations FROM=spree_gift_card'
      end

      def run_migrations
        res = ask 'Would you like to run the migrations now? [Y/n]'
        if res == '' || res.downcase == 'y'
          run 'rake db:migrate'
        else
          puts "Skipping rake db:migrate, don't forget to run it!"
        end
      end
    end
  end
end
