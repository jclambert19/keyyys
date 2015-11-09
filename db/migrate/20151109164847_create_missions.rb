class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :bunch, index: true, foreign_key: true
      t.string :location
      t.datetime :meeting_at
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
