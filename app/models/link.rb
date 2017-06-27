class Link < ActiveRecord::Base
  has_many :comments
  validates :user, :presence => true
  validates :link_url, :presence => true
  validates :description, :presence => true
end
