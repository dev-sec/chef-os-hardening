# frozen_string_literal: true

source 'https://rubygems.org'

gem 'berkshelf', '~> 7.0'
gem 'chef', '~> 14.11'

group :test do
  gem 'chefspec', '~> 7.3.4'
  gem 'coveralls', require: false
  gem 'foodcritic', '~> 15.1'
  gem 'rake'
  gem 'rubocop', '~> 0.65.0'
  gem 'simplecov', '~> 0.16'
end

group :integration do
  gem 'kitchen-digitalocean'
  gem 'kitchen-dokken'
  gem 'kitchen-inspec', '~> 1.0.1'
  gem 'kitchen-vagrant'
  gem 'test-kitchen', '~> 1.24'
end

group :tools do
  gem 'github_changelog_generator', '== 1.15.2'
end
