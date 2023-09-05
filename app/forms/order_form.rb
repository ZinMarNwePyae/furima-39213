class OrderForm
    include ActiveModel::Model
  
    # フォームの属性（アトリビュート）を定義
    attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number
  
    with_options presence: true do
      validates :user_id
      validates :item_id
      validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
      validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
      validates :city
      validates :block
      # 電話番号のバリデーションはテストコードが実装された後に追加する
    end
  
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Payment.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
    end
  end
  