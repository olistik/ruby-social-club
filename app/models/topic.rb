class Topic < ActiveRecord::Base
  attr_accessible :author, :event_id, :title, :position, :description
  belongs_to :event

  scope :ordered, order('position')
end
