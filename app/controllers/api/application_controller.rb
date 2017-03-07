module Api
  class ApplicationController < JSONAPI::ResourceController
    include Error::ErrorHandler

    protect_from_forgery with: :exception
  end
end