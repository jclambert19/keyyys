class AddRefSubscriptionToBunches < ActiveRecord::Migration
  def change
    add_reference :bunches, :subscription, index: true, foreign_key: true
  end
end
