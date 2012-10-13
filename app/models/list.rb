class List < ActiveRecord::Base
  attr_accessible :description, :event_date, :title, :user_id
  belongs_to :user
  has_many :items, :dependent => :destroy
  validates :title, :presence => true
end
