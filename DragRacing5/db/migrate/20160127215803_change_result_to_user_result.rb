class ChangeResultToUserResult < ActiveRecord::Migration
  def change
  	  add_column :results, :user_result, :string
  end
end
