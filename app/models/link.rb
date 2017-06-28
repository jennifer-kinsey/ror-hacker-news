class Link < ActiveRecord::Base
  has_many :comments
  validates :user, :presence => true
  validates :link_url, :presence => true
  validates :description, :presence => true

  after_initialize :init

  def init
    self.rank ||= 1
  end

  scope :ascending_by_rank, -> { order(rank: :asc) }
  scope :descending_by_rank, -> { order(rank: :desc) }
  scope :sort_by_oldest, ->{ order(created_at: :asc) }
  scope :sort_by_newest, ->{ order(created_at: :desc) }
  scope :sort_by_most_popular, -> {(
    select("links.*, count(comments.id) as comments_count")
    .joins(:comments)
    .group("links.id")
    .order("comments_count DESC")
    .limit(10)
    )}
  scope :sort_by_least_popular, -> {(
    select("links.*, count(comments.id) as comments_count")
    .joins(:comments)
    .group("links.id")
    .order("comments_count ASC")
    .limit(10)
    )}

end
