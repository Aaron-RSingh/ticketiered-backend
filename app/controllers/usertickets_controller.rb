class UserticketsController < ApplicationController
    # before_action :set_event, only: [:update, :destroy]
    # skip_before_action :authenticate_request, only: [:all_events, :show]
  
    def index
      @usertickets = current_user.usertickets
      json_response(@usertickets)
    end
  
    def all_events
      @usertickets = Userticket.all
      json_response(@usertickets)
    end
  
    def user_info
      @user = current_user
      json_response(@user)
    end
    
    def create
      @userticket = current_user.usertickets.create!(userticket_params)
      json_response(@userticket, :created)
    end
  
    def show
      @userticket = Userticket.find_by(id: params[:id])
      render json: {userticket: EventsSerializer.new(@event)}
    end
  
    def update
      @userticket.update(userticket_params)
      json_response(@userticket, :created)
    end
  
    def destroy
      @userticket.destroy
      json_response({message: "Success!"}, :destroyed)
    end
  
    private
  
    def userticket_params
      params.permit(:user_id, :ticket_id, :id)
    end
  
    def set_userticket
      @userticket = current_user.userticket.find(params[:id])
    end
end
