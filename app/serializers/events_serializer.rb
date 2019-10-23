class EventsSerializer < ActiveModel::Serializer
  attributes :name, :location, :date_time, :description, :image_url, :id, :tickets
 
end
