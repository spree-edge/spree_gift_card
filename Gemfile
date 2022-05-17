source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'spree', '~> 4.1.3'
gem 'rails-controller-testing'
gem 'rubocop-rails', require: false

group :test do
  gem 'timecop', '~> 0.8.1'
end
gemspec
