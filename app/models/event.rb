class Event < ActiveRecord::Base
  attr_accessible :finish, :start
  has_and_belongs_to_many :users
  has_one :location
  has_many :topics

  scope :incoming, where('start >= ?', Time.now).order('start')

  def toggle_subscription(user)
    if users.include?(user)
      users.delete user
    else
      users << user
    end
  end

  def ordered_topics
    topics.ordered
  end

  def has_topics?
    topics.count > 0
  end
end
