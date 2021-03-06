class Category < ActiveRecord::Base
  include Slugable
  has_many :post_categories
  has_many :posts, through: :post_categories
  validates :name, presence: true, uniqueness: true
  before_save :generate_slug

  def generate_slug
    self.slug = self.name.downcase
  end
end
