# frozen_string_literal: true

module SpreeGiftCard
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_gift_card'

    config.autoload_paths += %W[#{config.root}/lib]

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')).sort.each do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/models/spree/calculator/*.rb')).sort.each do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    initializer 'spree.register.payment_methods' do |app|
      app.config.spree.payment_methods << Spree::PaymentMethod::GiftCard
    end

    initializer 'spree.gift_card.permit_params' do |_app|
      Spree::PermittedAttributes.source_attributes << :code
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
