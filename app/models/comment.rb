class Comment < ActiveRecord::Base
  belongs_to :link
  validates :user, :presence => true
  validates :comments, :presence => true
end
