class Post < ActiveRecord::Base
  attr_accessible :title

  validates :title, uniqueness: { case_sensitive: false },
                    presence: true,
                    length: { minimum: 5 }

  validates :content, presence: true
end
