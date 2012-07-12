class Post < ActiveRecord::Base
  attr_accessible :title, :content, :author

  belongs_to :author, class_name: 'User'

  validates :title, uniqueness: { case_sensitive: false },
                    presence: true,
                    length: { minimum: 5 }

  validates :content, presence: true

  validates :author, presence: true

  validate :active_author, on: :create

  def active_author
    return if self.author.blank?
    errors.add(:author_id, 'is not active') unless self.author.active
  end
end
