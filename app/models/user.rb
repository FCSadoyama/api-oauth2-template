class User < ApplicationRecord
  after_update :revoke_sessions, if: -> { saved_change_to_attribute(:password_digest) }

  has_secure_password

  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all


  private

  def revoke_sessions
    Authorizations::Blockers::UserLoggout.new(id).call
  end
end
