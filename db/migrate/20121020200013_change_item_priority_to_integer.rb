class ChangeItemPriorityToInteger < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.change :priority, :integer
    end
  end
  def self.down
    change_table :items do |t|
      t.change :priority, :string
    end
  end
end
