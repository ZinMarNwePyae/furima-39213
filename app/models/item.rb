class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

    belongs_to :user

    belongs_to :category
    belongs_to :product_status
    belongs_to :shipping_fee
    belongs_to :prefecture
    belongs_to :shipping_duriation

    has_one_attached :image

    with_options presence: true do
        validates :user_id
        validates :image
        validates :name
        validates :description
        validates :category_id
        validates :product_status_id
        validates :shipping_fee_id
        validates :prefecture_id
        validates :shipping_duriation_id
        validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    
    end
end