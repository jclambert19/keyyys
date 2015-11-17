class AddPriceToSubscriptions < ActiveRecord::Migration
  def change
    add_monetize :subscriptions, :price, currency: { present: false }, default: 30
  end
end
