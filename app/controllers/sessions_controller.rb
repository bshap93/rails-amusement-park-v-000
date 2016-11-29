class SessionsController < ApplicationController
  def login

  end

  def create
    begin
      @user = User.find_by(name: params[:name])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    rescue NoMethodError
      redirect_to '/signin'
    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
