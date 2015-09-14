# config valid only for current version of Capistrano
lock '3.4.0'

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

set(:config_files, %w(
  database.example.yml
  secrets.example.yml
  shards.example.yml
  unicorn.rb
  unicorn_init.sh
  nginx.conf
))
set(:symlinks, [
  {
    source: "#{fetch(:shared_path)}/config/nginx.conf",
    link: "/etc/nginx/conf.d/default.conf"
  },
  {
    source: "#{fetch(:shared_path)}/config/unicorn_init.sh",
    link: "/etc/init.d/unicorn_#{fetch(:full_app_name)}"
  },
  {
    source: '/var/log/nginx/access.log',
    link: "#{fetch(:shared_path)}/log/nginx.log"
  },
  {
    source: '/var/log/nginx/error.log',
    link: "#{fetch(:shared_path)}/log/nginx_error.log"
  }
])
set(:executable_config_files, %w(
  unicorn_init.sh
))

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/shards.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

namespace :deploy do
  before 'deploy:setup_config', 'nginx:remove_default_vhost'
  after 'deploy:setup_config', 'nginx:reload'
  after 'deploy:publishing', 'unicorn:restart'
  after :finishing, :cleanup
end
