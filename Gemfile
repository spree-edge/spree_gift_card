# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails-controller-testing'
gem 'rubocop-rails', '~> 2.14', '>= 2.14.2'
gem 'spree', '~> 4.8'

group :test do
  gem 'timecop', '~> 0.8.1'
end
gemspec
