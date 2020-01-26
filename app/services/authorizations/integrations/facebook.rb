module Authorizations
  module Integrations
    class Facebook < BaseIntegration
      def url
        'https://graph.facebook.com/v2.6/me'
      end

      def desired_fields
        %W[id name email]
      end
    end
  end
end
