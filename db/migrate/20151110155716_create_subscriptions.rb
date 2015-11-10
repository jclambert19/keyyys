class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.date :start_date
      t.date :end_date
      t.references :user, index: true, foreign_key: true
      t.string :rdv_location
      t.datetime :rdv_date

      t.timestamps null: false
    end
  end
end
