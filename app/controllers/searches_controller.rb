class SearchesController < ApplicationController
  # GET /places
  # GET /places.json
  def index
    @contents = Content.all
  end
end
