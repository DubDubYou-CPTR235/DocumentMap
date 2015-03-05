class LoginRequiredController < ApplicationController
  layout "logout"
  before_action :authenticate_user!

  def add_document
    @document = Document.new
    render "map/add_document"
  end 

  def edit_document
    @document = Document.find(params[:id])
    render "map/edit_document"
  end

  def my_documents
    @documents = Document.where(user_id: current_user.id).all
    render "map/my_documents"
  end
end
