class ChangeItemPriorityDefaults < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.change :priority, :integer, :limit => 3, :default => 0
    end
  end
end
