require 'capistrano'
require 'capistrano-vexxhost'
require 'bundler/capistrano'


# Account Settings
set :user, "festival"
set :password, "5g484XvksY"
set :domain, "festivall.eu"
set :mount_path, "/"
set :application, "festivall"

set :repository, "/home/miguel/Programming/Festivall/Novo-Servidor"
set :local_repository, "/home/miguel/Programming/Festivall/Novo-Servidor"
set :scm, :git
set :deploy_via, :copy
