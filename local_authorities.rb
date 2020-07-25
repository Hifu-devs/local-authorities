require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'json'
require './services/places_service'
# require './servcies/place_details_service'
require 'pry'

class LocalAuthorities < Sinatra::Base

  get '/' do
    "HIFU Local Authorities Service"
  end

  get '/sheriff' do
    PlacesService.new.sheriff_search(request.params)
  end

end