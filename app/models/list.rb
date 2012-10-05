class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  attr_accessible :description, :event_date, :title
end
