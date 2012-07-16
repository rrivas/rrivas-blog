class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :active

  has_many :posts

  validates :first_name, presence: true,
                         format: { with: /([a-zA-Z]){1,}/, on: :create },
                         length: { minimum: 2 }

  validates :last_name, presence: true,
                        format: { with: /([a-zA-Z]){1,}/, on: :create },
                        length: { minimum: 2 }

  validates :email, uniqueness: { case_sensitive: false },
                    presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }

  validates :password, length: { minimum: 8 },
                       format: { with: /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,}$/i, on: :create }

  validates :active, presence: true
end
