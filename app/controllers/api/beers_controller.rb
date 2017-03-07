module Api
  class BeersController < JSONAPI::ResourceController

  def index
    abv, page = params.values_at(:abv,:page)

    options = {
        abv: abv,
        p: page
    }.compact

    raise Error::ArgumentError, 'missing required parameters!' if options.blank?

    result = BreweryDBClient.new.beers.get_all(options)

    render json: { data: result }
  end


  def show
    beer_id = 'oeGSxs'

    result = BreweryDBClient.new.beers.get(beer_id)

    render json: {data: result.as_json }
  end

  end
end