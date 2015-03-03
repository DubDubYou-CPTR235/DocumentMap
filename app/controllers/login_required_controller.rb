class LoginRequiredController < ApplicationController
  layout "logout"
  before_action :authenticate_user!

  def add_document
    @document = Document.new
    render "map/add_document"
  end 
end
