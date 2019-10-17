class EventsSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :date_time, :description, :tickets, :image_url
  has_many :tickets

  class TicketsSerializer < ActiveModel::Serializer
    attributes :id, :ticket_class, :description, :availability, :price
  end  

end
