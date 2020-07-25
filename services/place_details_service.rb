require 'faraday'
require 'dotenv'
Dotenv.load

class PlaceDetailsService

  def phone(place_id = nil)
    response = conn.get('') do |g|
      g.params['place_id'] = place_id
      g.params['fields'] = 'formatted_phone_number'
    end
    
    JSON.parse(response.body)['result']['formatted_phone_number']
  end

  private

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/place/details/json') do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end
end