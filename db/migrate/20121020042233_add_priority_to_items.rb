class AddPriorityToItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.string :priority
    end
  end
end
