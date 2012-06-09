class Location < ActiveRecord::Base
  attr_accessible :address, :gmap_code, :gmap_link
  belongs_to :event
end
