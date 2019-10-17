class TicketsSerializer < ActiveModel::Serializer
  attributes :id, :ticket_class, :description, :availability, :price
end
