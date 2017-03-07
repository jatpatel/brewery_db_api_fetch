require 'httparty'

class BreweryDBClient
  include HTTParty

  base_uri 'http://api.brewerydb.com/v2/'
  format :json
  default_params :format => 'JSON'

  attr_reader :api_key

  def initialize
    @api_key = '4b292651a0a6d61f9514b6b108429cf6'.freeze
  end

  def beers
    @beers ||= Api::BeerResource.new(self)
  end

  def get_response(uri, options={})
    options.merge!({
                       key: @api_key,
                       format: 'json'
                   })

    response = self.class.get(uri, :query => options)

    response.parsed_response["data"] if response.code == 200
  end
end
