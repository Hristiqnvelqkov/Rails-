class AddCarIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :car_id, :integer
  end
end
