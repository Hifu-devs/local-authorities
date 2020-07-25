require 'faraday'
require 'dotenv'
Dotenv.load

class PlacesService
  def sheriff_search(coords)
    response = conn.get('') do |g|
      g.params['input'] = 'sheriff'
      g.params['inputtype'] = 'textquery'
      g.params['fields'] = 'name,formatted_address,place_id'
      g.params['locationbias'] = 'point:' + coords[lat] ',' + coords[long]
    end
  end

  private

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json') do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end
end