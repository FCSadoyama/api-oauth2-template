module Authorizations
  module Authenticators
    class Assertion
      def initialize(provider:, assertion:)
        @provider = provider
        @assertion = assertion
      end

      def call
        return if user_info.error.any?
        ::Authorizations::SocialAuth::User.new(user_info).call
      end

      private

      attr_reader :provider, :assertion

      def user_info
        @user_info ||= integration.new(assertion).call
      end

      def integration
        "::Authorizations::Integrations::#{provider.classify}".constantize
      end
    end
  end
end