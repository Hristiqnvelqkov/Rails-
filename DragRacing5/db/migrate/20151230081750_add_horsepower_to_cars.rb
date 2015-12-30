class AddHorsepowerToCars < ActiveRecord::Migration
  def change
    add_column :cars, :horsepower, :integer
  end
end
