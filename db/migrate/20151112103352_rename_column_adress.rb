class RenameColumnAdress < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :adress, :address
  end
end
