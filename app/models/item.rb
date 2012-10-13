class Item < ActiveRecord::Base
  belongs_to :list
  attr_accessible :description, :name, :url
  validates :name, :presence => true
end
