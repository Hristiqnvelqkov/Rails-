class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description

      t.timestamps null: false
    end
    create_table :users do |t|
    	t.belongs_to :events, index:true
    	t.string :email

    	t.timestamps null: false
    end
  end
end
