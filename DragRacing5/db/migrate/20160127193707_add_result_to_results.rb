class AddResultToResults < ActiveRecord::Migration
  def change
    add_column :results, :result, :float
  end
end
