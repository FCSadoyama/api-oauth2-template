module Authorizations
  module SocialAuth
    class User
      def initialize(user_info)
        @user_info = user_info
      end

      def call
        user_by_uid || user_by_email || new_user
      end

      private

      attr_reader :user_info
      delegate :id, :provider, :email, to: :user_info 

      def user_by_uid
        ::User.find_by(provider: provider, uid: id)
      end

      def user_by_email
        user = ::User.find_by(email: email)
        user.tap do |u|
          u.update_columns(provider: provider, uid: id)
        end
      end

      def new_user
        password = SecureRandom.hex
        ::User.new(
          email: email,
          password: password,
          password_confirmation: password,
          provider: provider,
          uid: id
        )
      end
    end
  end
end
