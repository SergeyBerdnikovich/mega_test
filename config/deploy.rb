set :application, 'mega_test'
set :repo_url, 'git@github.com:SergeyBerdnikovich/mega_test.git'
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :deploy_user, 'atom'
set :deploy_to, "/var/www/apps/#{fetch(:application)}"
set :shared_path, "#{fetch(:deploy_to)}/shared"
set :conditionally_migrate, true
set :rvm_type, :user
set :rvm_ruby_version, "2.2.1@#{fetch(:application)}"
set :keep_releases, 6
set :scm, :git
set :log_level, :debug
set :passenger_in_gemfile, true
set :passenger_port, 4000
set :bundle_cmd, 'source $HOME/.bash_profile && bundle'
set :passenger_cmd, "#{fetch(:bundle_cmd)} exec passenger"

set(:config_files, %w(
  database.example.yml
  secrets.example.yml
  shards.example.yml
  Passengerfile.example.json
))
set(:symlinks, [])
set(:executable_config_files, [])

set :linked_files, fetch(:linked_files, []).push('config/database.yml',
                                                 'config/secrets.yml',
                                                 'config/shards.yml',
                                                 'config/Passengerfile.json')
set :linked_dirs, fetch(:linked_dirs, []).push('log',
                                               'tmp/pids',
                                               'tmp/cache',
                                               'tmp/sockets',
                                               'vendor/bundle',
                                               'public/system')

namespace :deploy do
  after 'deploy:publishing', 'passenger:restart'
  after :finishing, :cleanup
end
