class Api::V1::MeetsController < ApplicationController
  # GET /meets
  def index
    @meets = Meet.all
    render json: @meets
  end
end
