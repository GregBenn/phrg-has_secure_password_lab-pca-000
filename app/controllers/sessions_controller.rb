# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end

  def destroy
    session.delete :name if session[:name]
    redirect_to "/"
  end
end
