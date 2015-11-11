class AddAddressToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :adress, :string
  end
end
