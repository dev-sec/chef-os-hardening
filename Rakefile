# encoding: utf-8

# rubocop:disable Style/SymbolArray

require 'foodcritic'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'base64'
require 'chef/cookbook/metadata'

# General tasks

# Rubocop before rspec so we don't lint vendored cookbooks
desc 'Run all tests except Kitchen (default task)'
task default: [:lint, :spec]

# Lint the cookbook
desc 'Run all linters: rubocop and foodcritic'
task lint: [:rubocop, :foodcritic]

# Run the whole shebang
desc 'Run all tests'
task test: [:lint, :kitchen, :spec]

# RSpec
desc 'Run chefspec tests'
task :spec do
  puts 'Running Chefspec tests'
  RSpec::Core::RakeTask.new(:spec)
end

# Foodcritic
desc 'Run foodcritic lint checks'
task :foodcritic do
  puts 'Running Foodcritic tests...'
  FoodCritic::Rake::LintTask.new do |t|
    t.options = { fail_tags: ['any'] }
    puts 'done.'
  end
end

# Rubocop
desc 'Run Rubocop lint checks'
task :rubocop do
  RuboCop::RakeTask.new
end

# Automatically generate a changelog for this project. Only loaded if
# the necessary gem is installed.
begin
  # read version from metadata
  metadata = Chef::Cookbook::Metadata.new
  metadata.instance_eval(File.read('metadata.rb'))

  # build changelog
  require 'github_changelog_generator/task'
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.future_release = "v#{metadata.version}"
    config.user = 'dev-sec'
    config.project = 'chef-os-hardening'
  end
rescue LoadError
  puts '>>>>> GitHub Changelog Generator not loaded, omitting tasks'
end

desc 'Run kitchen integration tests'
task :kitchen do
  concurrency = ENV['CONCURRENCY'] || 1
  instance = ENV['INSTANCE'] || ''
  args = ENV['CI'] ? '--destroy=always' : ''
  sh('sh', '-c', "bundle exec kitchen test -c #{concurrency} #{args} #{instance}")
end

desc 'Prepare CI environment for DigitalOcean usage'
task :prepare_do_env do
  SSH_KEY_FILE = '~/.ssh/ci_id_rsa'.freeze
  ENV_VAR_NAME = 'CI_SSH_KEY'.freeze

  ['DIGITALOCEAN_ACCESS_TOKEN', 'DIGITALOCEAN_SSH_KEY_IDS', ENV_VAR_NAME].each do |var|
    raise "Environment variable #{var} should be set" unless ENV[var]
  end

  ssh_file = File.expand_path(SSH_KEY_FILE)
  dir = File.dirname(ssh_file)
  Dir.mkdir(dir, 0o700) unless Dir.exist?(dir)
  File.open(ssh_file, 'w') { |f| f.puts Base64.decode64(ENV[ENV_VAR_NAME]) }
  File.chmod(0o600, ssh_file)
end
