module Error
  class ApplicationError < StandardError
    attr_reader :status, :error, :message

    def initialize(_message = nil, _status = nil, _error = nil)
      @error = _error || 500
      @message = _message || 'Something unexpected happened!'
      @status = _status || :internal_server_error
    end

    def fetch_json
      Helpers::Render.json(error, message, status)
    end
  end
end