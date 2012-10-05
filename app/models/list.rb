class List < ActiveRecord::Base
  has_many :items
  attr_accessible :description, :event_date, :title
end
