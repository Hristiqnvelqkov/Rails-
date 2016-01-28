class AddVisitorIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :visitor_id, :integer
  end
end
