class UserticketsController < ApplicationController
    before_action :set_event, only: [:update, :destroy]
    skip_before_action :authenticate_request, only: [:index, :create, :show]#[:all_events, :show]
  
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
      user = user_from_token
      ticket = Ticket.find_by(id: params[:ticket_id])
      @userticket = Userticket.create(user_id: user.id ,ticket_id: ticket.id)
      # byebug
      json_response(@userticket, :created)
    end
  
    def show
      @userticket = Userticket.find_by(id: params[:id])
      render json: {userticket: EventsSerializer.new(@userticket)}
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
