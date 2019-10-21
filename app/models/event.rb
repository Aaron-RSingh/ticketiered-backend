class Event < ApplicationRecord

  belongs_to :user
  has_many :tickets

  def self.filter_events(filter)
    self.select do |event|
      event.name.downcase.include?(filter.downcase)
    end
  end

end
