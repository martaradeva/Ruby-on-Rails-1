class UsersController < ApplicationController
  before_action :authenticate_user, except: [:login, :authenticate]

  def login
    # render login form
    # validate user input
    # crypt password ??
    @user = User.new
    render 'login'
  end

  def authenticate
    # p params
    set_user_by_email
    @user = @pseudo_user.try(:authenticate, params[:user][:password])
    # if @pseudo_user.try(:authenticate, params[:user][:password])
    #   then @user = _
    # else 
    # @user = User.find_by_email(params[:user][:email])
    # if @user.password == params[:user][:password]
    #   set_cookie
    # end
      redirect_to "/profile/#{@user.id}"
    # check if user with params exists
    # if it exists, create session cookie
    # send cookie and redirect to 'profile/user_id'
  end

  def logout
    # destroy session and logout user
    # redirect to 'users/login'
  end

  def show
    set_user
    p @user.first_name
    # check for cookies
    # render a simple view with user credentials.
  end

  def new
    @user = User.new
    # render form for new user
    # validate user input
    # crypt password with bcrypt
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
    @notice = "User was successfully created."
    redirect_to "profile/#{@user.id}"
    # create a new user
    # pass a notice
    # then, redirect to user login
  end

  def edit
    set_user
    # render form for new user
    # validate user input
    # crypt password with bcrypt
  end

  def update
    set_user
    @user.update!
    @notice = "User was successfully updated."
    redirect_to "profile/#{@user.id}"
    # check for consistency 
    # update the existing user
    # pass a notice
    # then, redirect to user show
  end

  def delete
    # to write later
  end

private

  def permitted_params
    params.require(:user).require(:email, :password).permit(:first_name, :last_name, :password_confirmation)
  end

  def authenticate_user
    # check if cookie is present
    # authenticate user
    # p "lalala"
  end

  def set_cookie
    # cookies[:login] = { value: "#{@user.id}", expires: 1.hour.from_now }
  end

  def set_user
    @user = User.find(params[:user_id])
    p @user
    @notice = "You must be logged in to see this page."
    # check for cookie -> if not present, redirect to login with notice.
  end

  def set_user_by_email
    @pseudo_user = User.find_by(email: params[:user][:email])
    # p @user
  end

end
