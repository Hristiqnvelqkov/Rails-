class AddAvatarsToEvents < ActiveRecord::Migration
    def self.up
    change_table :events do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :events, :avatar
  end
end
