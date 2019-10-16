class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:all_events]

  def index
    @events = current_user.events
    json_response(@events)
  end

  def all_events
    @events = Event.all
    json_response(@events)
  end

  def user_info
    @user = current_user
    json_response(@user)
  end
  
  def create
    @event = current_user.events.create!(event_params)
    json_response(@event, :created)
  end

  def show
    json_response(@event)
  end

  def update
    @event.update(event_params)
    json_response(@event, :created)
  end

  def destroy
    @event.destroy
    json_response({message: "Success!"}, :destroyed)
  end

  private

  def event_params
    params.permit(:name, :location, :date_time, :description, :image_url)
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end

end
