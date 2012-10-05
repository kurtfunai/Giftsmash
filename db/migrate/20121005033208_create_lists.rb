class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.text :description
      t.datetime :event_date

      t.timestamps
    end
  end
end
