class AddVideoToEvents < ActiveRecord::Migration
  	def self.up
    	change_table :events do |t|
    	t.attachment :video
    end
  end

  def self.down
    drop_attached_file :events, :video
  end
end
