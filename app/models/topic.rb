class Topic < ActiveRecord::Base
  attr_accessible :author, :event_id, :title, :position
  belongs_to :event

  scope :ordered, order('position')
end
