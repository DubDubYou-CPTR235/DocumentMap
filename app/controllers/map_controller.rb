class MapController < ApplicationController
  layout "logout"

  def index
  end

  def view_document
    @document = Document.find(params[:id])
  end
end
