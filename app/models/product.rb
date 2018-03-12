class Product < ApplicationRecord

    validates :title, :description ,:image_url, presence: true
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
end
