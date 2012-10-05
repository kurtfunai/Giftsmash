class AddListsFkToUsers < ActiveRecord::Migration
  def change
    change_table :lists do |t|
      t.references :user
    end
  end
end
