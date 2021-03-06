module Error
  class ArgumentError < StandardError
    attr_reader :status, :error, :message

     def initialize(_message = nil, _status = nil, _error = nil)
       @error = _error || 422
       @message = _message || 'received an unexpected parameters!'
       @status = _status || :unprocessable_entity
     end

      def fetch_json
        Helpers::Render.json(error, message, status)
      end
  end
end