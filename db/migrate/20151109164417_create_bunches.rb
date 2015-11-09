class CreateBunches < ActiveRecord::Migration
  def change
    create_table :bunches do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.integer :bunch_number
      t.boolean :in_safe
      t.date :received_on
      t.text :description
      t.integer :number_of_items

      t.timestamps null: false
    end
  end
end
