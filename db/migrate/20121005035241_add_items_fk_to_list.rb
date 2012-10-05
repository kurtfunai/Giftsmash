class AddItemsFkToList < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.references :list
    end
  end
end
