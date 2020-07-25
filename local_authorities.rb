require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'json'
require './services/places_service'
require './services/place_details_service'
require 'pry'

class LocalAuthorities < Sinatra::Base

  get '/' do
    "HIFU Local Authorities Service"
  end

  get '/sheriff' do
    authorities = PlacesService.new.sheriff_search(request.params)
    authorities['phone'] = PlaceDetailsService.new.phone(authorities['place_id'])
    response['nearest_authority'] = authorities.to_json
   
  end

end