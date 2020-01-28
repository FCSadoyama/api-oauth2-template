module Authorizations
  module Blockers
    class UserLoggout
      def initialize(user_id)
        @user_id = user_id
      end

      def call
        tokens.each(&:revoke)
      end

      private

      attr_reader :user_id

      def tokens
        @tokens ||= Doorkeeper::AccessToken.where(resource_owner_id: user_id, revoked_at: nil)
      end
    end
  end
end
