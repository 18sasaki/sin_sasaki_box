require 'rubygems'
require 'bundler'
Bundler.require
require './app.rb'
require './project/cd/app.rb'

run Sinatra::Application

