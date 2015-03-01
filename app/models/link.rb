class Link < ActiveRecord::Base
  belongs_to :user
  has_many :visits

  validates :slug, :presence => true
  validates :target_url, :presence => true
  validates :slug, :uniqueness => true

  def standardize_target_url!
    self.target_url.gsub!("http://", "")
    self.target_url.gsub!("https://", "")
  end

  def visit_count
    self.visits.count
  end

end
