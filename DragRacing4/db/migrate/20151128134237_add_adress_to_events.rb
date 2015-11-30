class AddAdressToEvents < ActiveRecord::Migration
  def change
    add_column :events, :adress, :string
  end
end
