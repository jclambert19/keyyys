class AddStateAndPaymentToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :state, :string
    add_column :subscriptions, :payment, :json
  end
end
