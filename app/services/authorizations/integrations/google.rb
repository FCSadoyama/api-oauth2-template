module Authorizations
  module Integrations
    class Google < BaseIntegration
      def url
        'https://www.googleapis.com/oauth2/v1/userinfo'
      end

      def desired_fields
        %W[id name email]
      end
    end
  end
end
