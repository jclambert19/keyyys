class AddRdvDateToBunches < ActiveRecord::Migration
  def change
     add_column :bunches, :rdv_location, :string
     add_column :bunches, :rdv_date, :datetime
  end
end
