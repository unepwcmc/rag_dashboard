# config valid only for current version of Capistrano
lock '3.4.1'


set :application, 'rag-dashboard'
set :repo_url, 'git@github.com:unepwcmc/rag_dashboard.git'
set :branch, 'master'

set :deploy_user, 'wcmc'
set :deploy_to, "/home/#{fetch(:deploy_user)}/#{fetch(:application)}"

set :scm, :git
set :scm_username, "unepwcmc-read"

set :rvm_type, :user
set :rvm_ruby_version, '2.2.3'


set :pty, true


set :ssh_options, {
  forward_agent: true,
}


set :linked_files, %w{config/database.yml}

set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle')

set :keep_releases, 5
