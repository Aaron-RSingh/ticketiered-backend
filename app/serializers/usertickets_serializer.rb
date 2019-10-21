class UserticketsSerializer < ActiveModel::Serializer
  attributes :id, :ticket_id, :user_id
  belongs_to :user
  belongs_to :ticket

  class UsersSerializer < ActiveModel::Serializer
    attributes :id, :username
  end
end
