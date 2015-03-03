class MapController < ApplicationController
  layout "logout"
  before_action :authenticate_user!

  def index
  end

  def add_document
  end

  def view_document
  end
end
