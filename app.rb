#coding: utf-8

require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'sqlite3://localhost/myapp.db')

enable :sessions
set :session_secret, '18sasaki'

# top
get '/' do
  erb :index
end
