class Link < ActiveRecord::Base
  has_many :comments
  validates :user, :presence => true
  validates :link_url, :presence => true
  validates :description, :presence => true
  after_initialize :init

  def init
    self.rank ||= 1
  end
end
