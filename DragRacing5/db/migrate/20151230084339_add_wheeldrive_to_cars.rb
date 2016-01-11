class AddWheeldriveToCars < ActiveRecord::Migration
  def change
    add_column :cars, :wheeldrive, :string
  end
end
