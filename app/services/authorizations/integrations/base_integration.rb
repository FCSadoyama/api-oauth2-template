module Authorizations
  module Integrations
    class BaseIntegration
      def initialize(assertion)
        @assertion = assertion
      end

      def call
        Oj.load(response.body, symbol_keys: true)
      end

      private

      attr_reader :assertion

      def response
        @response ||= connection.get
      end

      def connection
        Faraday.new(
          url: url,
          params: {
            access_token: assertion,
            fields: requested_fields
          }
        )
      end

      def requested_fields
        desired_fields.join(',')
      end

      def url
        raise NotImplementedError
      end

      def desired_fields
        raise NotImplementedError
      end
    end
  end
end
