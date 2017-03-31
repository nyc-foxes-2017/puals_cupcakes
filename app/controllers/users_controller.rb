class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      session[:user_id] = user.id
      redirect_to @user
    else
      render :new
    end
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate
      session[:user_id] = user.id
      redirect_to @user
    else
      redirect_to '/users/log_in'
    end
  end

  def show
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

end
