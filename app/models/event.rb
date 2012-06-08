class Event < ActiveRecord::Base
  attr_accessible :finish, :start
  has_and_belongs_to_many :users

  def toggle_subscription(user)
    if users.include?(user)
      users.delete user
    else
      users << user
    end
  end

end
