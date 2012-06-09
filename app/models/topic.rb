class Topic < ActiveRecord::Base
  attr_accessible :author, :event_id, :title
  belongs_to :event
end
