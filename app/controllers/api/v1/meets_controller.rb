class Api::V1::MeetsController < ApplicationController
  # GET /meets
  def index
    @meets = Meet.all
    render json: @meets
  end

  def show
    @meet = Meet.find(params[:id])
    render json: @meet
  end
end
