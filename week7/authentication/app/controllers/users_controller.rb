class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:login, :authenticate]

  def login
    # render login form
    # validate user input
    # crypt password ??
  end

  def authenticate
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect_to 'login'
    end
    # check if user with params exists
    # if it exists, create session cookie
    # send cookie and redirect to 'profile/user_id'
  end

  def logout
    # destroy session and logout user
    # redirect to 'users/login'
  end

  def show
    # render a simple view with user credentials.
  end

  def new

    # render form for new user
    # validate user input
    # crypt password with bcrypt
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
    # create a new user
    # pass a notice
    # then, redirect to user login
  end

  def edit
    # render form for new user
    # validate user input
    # crypt password with bcrypt
  end

  def update
    # update the existing user
    # pass a notice
    # then, redirect to user show
  end

  def delete
    # to write later
  end

private

  def permitted_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
