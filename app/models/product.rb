class Product < ApplicationRecord
    has_many :line_items
    validates :title, :description ,:image_url, presence: true
    before_destroy :ensure_not_referenced_by_any_line_item
    # The validates() method is the standard Rails validator. It checks one or more
    # model fields against one or more condition
#     presence: true tells the validator to check that each of the named fields is present
# and that its contents aren’t empty.

    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: {
        with:
        %r{\.(gif|jpg|jpeg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
        }


 
 
#


private
 # ensure that there are no line items referencing this product
 def ensure_not_referenced_by_any_line_item
 unless line_items.empty?
 errors.add(:base, 'Line Items present')
 throw :abort
 end
 end
end
