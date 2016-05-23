class AddCoupeToCars < ActiveRecord::Migration
  def change
    add_column :cars, :coupe, :string
  end
end
