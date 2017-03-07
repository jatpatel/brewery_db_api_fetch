module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ArgumentError do |e|
          respond(e.error, e.status, e.message.to_s)
        end
        rescue_from ApplicationError do |e|
          respond(e.error, 500, e.to_s)
        end
      end
    end

    private

    def respond(_error, _status, _message)
      error_json = {
          status: _status,
          error: _error,
          message: _message
      }.as_json

      render json: error_json, status: _status, :content_type => 'application/json'
    end
  end
end