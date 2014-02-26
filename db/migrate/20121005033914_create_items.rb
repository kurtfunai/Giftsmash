class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :url
      t.text :description
      t.integer :priority, :limit => 3, :default => 0

      t.timestamps
    end
  end
end
