#coding: utf-8

require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'sqlite3://localhost/myapp.db')

require_relative 'models/init'

enable :sessions
set :session_secret, '18sasaki'

# top
get '/' do
  erb :index
end


helpers do
  def sex_hash
    { '0' => '', '1' => '男', '2' => '女', '3' => '非公開' }
  end

  def sex_translate(sex_int)
    sex_hash[sex_int.to_s]
  end

  def sess(*keys)
    keys.inject(session) do |ret, key|
      ret.try(:[], key)
    end
  end

  def sess_include?(key, value)
    session[key] || {}
  end
end
