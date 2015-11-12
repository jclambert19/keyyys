class RemoveAddressFromSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :address, :string
  end
end
