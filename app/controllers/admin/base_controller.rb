class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :admin?

  private
    def admin?
      if !signed_in? || current_user.admin != 1
        redirect_to root_path
      end
    end
end