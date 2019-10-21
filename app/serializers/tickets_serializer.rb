class TicketsSerializer < ActiveModel::Serializer
  attributes :id, :ticket_class, :description, :availability, :price
  has_many :usertickets

  class UserticketsSerializer < ActiveModel::Serializer
    attributes :id, :ticket_id, 
  end

end
