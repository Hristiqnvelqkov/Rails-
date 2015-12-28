class AddMarkToCars < ActiveRecord::Migration
  def change
    add_column :cars, :mark, :string
  end
end
