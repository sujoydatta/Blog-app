class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
    @users = User.all.paginate(page: params[:page],per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @entries = @user.entries.paginate(page: params[:page], per_page: 10)
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        log_in @user
      	flash[:success] = "Welcome"
      	redirect_to @user
    else
      	render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
