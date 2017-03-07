module Api
  class BeerResource < JSONAPI::Resource

    def initialize(brewery_db_client)
      @client = brewery_db_client
    end

    def get_all(options = {})
      # default: page number
      options[:page] = 1 unless options[:page] && options[:page] > 0

      response_data = @client.get_response('/beers', options)

      return nil if response_data.nil?

      response_data.map do |beer_data|
          Beer.new(beer_data).as_json
      end
    end

    def get(id)
      response_data = @client.get_response("beer/#{id}")

      return nil if response_data.nil?

      Beer.new(response_data)
    end

  end
end