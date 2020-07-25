require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'json'

class LocalAuthorities < Sinatra::Base

  get '/' do
    "HIFU Local Authorities Service"
  end

  get '/sheriff' do
    pry
  end

end