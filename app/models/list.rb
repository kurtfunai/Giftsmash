class List < ActiveRecord::Base
  extend FriendlyId
  friendly_id :date_and_user_id, use: :slugged

  attr_accessible :description, :event_date, :title
  belongs_to :user
  has_many :items, :dependent => :destroy
  validates :title, :presence => true

  # When creating a list, set the slug to be a sha1 hash of Time.new + user_id 
  def date_and_user_id
    self.slug = Digest::SHA1.hexdigest(Time.now.to_s + self.user_id.to_s + CONFIG[:list_slug_salt])
  end

  def should_generate_new_friendly_id?
    new_record?
  end

  # Checks if the id given is slug or list id.
  def found_using_friendly_id?(id = 0)
    id === self.slug
  end
end
