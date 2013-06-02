# -*- encoding: utf-8 -*-
class SessionsController < ApplicationController
  before_filter :do_not_sign, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to discussions_path
    else
      flash[:error] = '邮箱或密码错误'
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end