# -*- coding: utf-8 -*-
module SessionsHelper

  def sign_in(user)
    user.update_attributes(remember_token: SecureRandom.urlsafe_base64, last_login: Time.now.strftime("%Y-%m-%d %H:%M:%S"))
    cookies.permanent[:remember_token] = user.remember_token
    # cookies.permanent[:remember_token] = SecureRandom.urlsafe_base64
    # user.update_attributes(remember_token: cookies.[:remember_token])
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user=nil
    cookies.delete(:remember_token)
  end

  def signed_in_user
    redirect_to signin_path, notice: "请先登陆." unless signed_in?
  end

  def do_not_sign
    redirect_to root_path if signed_in?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    user == self.current_user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def print_v(val)
    @pv = val
  end

end