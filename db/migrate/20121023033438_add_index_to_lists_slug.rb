class AddIndexToListsSlug < ActiveRecord::Migration
  def change
    add_index :lists, :slug
  end
end
