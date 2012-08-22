class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :active

  has_many :posts

  validates :first_name, presence: true,
                         format: { with: /(\A[A-Z\s][^0-9]+\z)/i, on: :create },
                         length: { minimum: 2 }

  validates :last_name, presence: true,
                        format: { with: /(\A[A-Z\s][^0-9]+\z)/, on: :create },
                        length: { minimum: 2 }

  validates :email, uniqueness: { case_sensitive: false },
                    presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }

  validates :password, length: { minimum: 8 },
                       format: { with: /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,}$/i, on: :create }

  validates :active, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
