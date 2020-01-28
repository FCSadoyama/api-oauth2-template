module Authorizations
  module Authenticators
    class Assertion
      def initialize(provider:, assertion:)
        @provider = provider
        @assertion = assertion
      end

      def call
        raise ExceptionHandler::CustomError.new(**user_info.error) if user_info.error.present?
        ::Authorizations::SocialAuth::User.new(user_info).call
      end

      private

      attr_reader :provider, :assertion

      def user_info
        @user_info ||= OpenStruct.new(
          integration_response.merge(provider: provider)
        )
      end

      def integration_response
        integration.new(assertion).call
      end

      def integration
        "::Authorizations::Integrations::#{provider.classify}".constantize
      end
    end
  end
end
