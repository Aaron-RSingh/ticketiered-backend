class UsersSerializer < ActiveModel::Serializer
  # attributes :id, :username
  attributes :complete_user

  def complete_user
    {
      username: object.username,
      tickets: object.usertickets.map do |userticket| 
        {   
          class: userticket.ticket.ticket_class, 
          price: userticket.ticket.price,
          description: userticket.ticket.description,
          event_id: userticket.ticket.event_id
        }

      end
    }
  end

end
