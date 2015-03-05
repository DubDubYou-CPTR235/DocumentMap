class DocumentsController < ApplicationController
  def create
    @document = Document.new(document_params)
    @document.user_id = current_user.id
    @document.save!
    redirect_to "/view_document/" + @document.id.to_s
  end

  def update
    @document = Document.find(params[:id])
    @document.update_attributes(document_params)
    redirect_to "/view_document/" + @document.id.to_s
  end

  private
  def document_params
    params.require(:document).permit(:name, :description, :upload_date, :address, :lat, :lng, :upload)
  end
end
