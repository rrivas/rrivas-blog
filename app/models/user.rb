class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  validates :last_name, presence: true,
                        format: { with: /([a-z][A-Z]){1,}/, on: :create }

  validates :email, uniqueness: { case_sensitive: false },
                    presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
end
