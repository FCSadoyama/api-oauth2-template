module Authorizations
  class Password
    def initialize(email:, password:)
      @email = email
      @password = password
    end

    def call
      user if authenticated?
    end

    private

    attr_reader :email, :password

    def authenticated?
      user.authenticate(password)
    end

    def user
      @user ||= User.find_by(email: email)
    end
  end
end
