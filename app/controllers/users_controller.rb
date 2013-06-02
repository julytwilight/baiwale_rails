# -*- encoding: utf-8 -*-
class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :corrent_user, only: [:edit, :update]
  before_filter :do_not_sign, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    @topics = @user.topics.paginate(page: params[:page], :per_page => 30)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to discussions_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = '修改资料成功'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  def modify_password
    @user = User.find(params[:id])
    if @user.authenticate(params[:user][:old_password])
      params[:user].delete(:old_password)
      
      if params[:user]['password'].length < 6
        flash[:error] = '密码最少6位'
        redirect_to edit_user_path(@user)
        return
      end

      if params[:user]['password'] != params[:user]['password_confirmation']
        flash[:error] = '两次输入密码不同'
        redirect_to edit_user_path(@user)
        return
      end

      if @user.update_attributes(params[:user])
        flash[:success] = '密码修改成功'
        redirect_to @user
        return
      else
        flash[:error] = '保存未成功'
        redirect_to edit_user_path(@user)
        return
      end
    else
      flash[:error] = '原密码输入不正确'
      redirect_to edit_user_path(@user)
      return
    end
  end

  private
    def corrent_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end