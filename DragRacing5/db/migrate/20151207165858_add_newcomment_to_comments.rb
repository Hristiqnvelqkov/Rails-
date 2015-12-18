class AddNewcommentToComments < ActiveRecord::Migration
  def change
    add_column :comments, :newcomment, :string
  end
end
