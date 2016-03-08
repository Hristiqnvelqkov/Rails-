class AddAvatarsToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :cars, :avatar
  end
end
