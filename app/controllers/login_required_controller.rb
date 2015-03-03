class LoginRequiredController < ApplicationController
  layout "logout"
  before_action :authenticate_user!

  def add_document
    render "map/add_document"
  end 
end
