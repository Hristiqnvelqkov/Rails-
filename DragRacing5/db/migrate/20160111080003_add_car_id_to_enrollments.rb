class AddCarIdToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :car_id, :integer
  end
end
