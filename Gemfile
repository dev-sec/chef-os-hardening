# encoding: utf-8

source 'https://rubygems.org'

gem 'berkshelf', '~> 5.3'
gem 'chef', '~> 12.5'

group :test do
  gem 'chefspec', '~> 5.3.0'
  gem 'coveralls', require: false
  gem 'foodcritic', '~> 6.0'
  gem 'rake'
  gem 'rubocop', '~> 0.46.0'
  gem 'simplecov', '~> 0.10'
end

group :development do
  gem 'guard'
  gem 'guard-foodcritic', '~>2.1'
  gem 'guard-rspec'
  gem 'guard-rubocop'
end

group :integration do
  gem 'kitchen-dokken'
  gem 'kitchen-inspec'
  gem 'kitchen-vagrant'
  gem 'test-kitchen', '~> 1.0'
end

group :tools do
  gem 'github_changelog_generator', '~> 1.12.0'
end
