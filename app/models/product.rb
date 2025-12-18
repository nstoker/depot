class Product < ApplicationRecord
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  has_one_attached :image
  validates :title, uniqueness: true, presence: true
  validates :description, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validate :acceptable_image

  after_commit -> { broadcast_refresh_later_to "products" }

  def acceptable_image
    return unless image.attached?

    acceptable_types = [ "image/gif", "image/png", "image/jpeg" ]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "mush be a GIF, JPG, or PNG type")
    end
  end

  private
    # Ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, "Line Items present")
        throw :abort
      end
    end
end
