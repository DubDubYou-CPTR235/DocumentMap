class MapController < ApplicationController
  layout "logout"

  def index
    @documents = Document.all.to_json.html_safe
  end

  def view_document
    @document = Document.find(params[:id])
  end
end
