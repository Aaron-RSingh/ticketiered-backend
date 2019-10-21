class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]
  skip_before_action :authenticate_request, only: [:create, :show]

  def index
    @users = User.all
    json_response(@users)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def show
    # @event = Event.find_by(id: params[:id])
    # render json: {event: EventsSerializer.new(@event)}
    @user = User.find_by(id: params[:id])
    # json_response(@user)
    render json: {event: UsersSerializer.new(@user)}
  end

  def update
    @user.update(user_params)
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.permit(:email, :username, :password, :primary_location)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

