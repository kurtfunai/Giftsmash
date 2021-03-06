class Item < ActiveRecord::Base
  belongs_to :list
  attr_accessible :description, :name, :url, :priority, :asin
  validates :name, :list_id, :presence => true
end
