class AddEnginetypeToCars < ActiveRecord::Migration
  def change
    add_column :cars, :enginetype, :string
  end
end
