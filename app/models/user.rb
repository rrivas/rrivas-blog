class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  attr_accessor :password
  before_save :encrypt_password

  validates :first_name, presence: true,
                         format: { with: /([a-z][A-Z]){1,}/, on: :create },
                         length: { minimum: 2 }

  validates :last_name, presence: true,
                        format: { with: /([a-z][A-Z]){1,}/, on: :create },
                        length: { minimum: 2 }

  validates :email, uniqueness: { case_sensitive: false },
                    presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
