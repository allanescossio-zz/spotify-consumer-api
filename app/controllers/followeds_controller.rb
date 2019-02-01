class FollowedsController < ApplicationController
  before_action :set_followed, only: [:show, :update, :destroy]

  # GET /followeds
  def index
    command = GetFolloweds.call(params[:spotify_token])

    if command.success?
      render json: command.result, status: :ok
    else
      render json: {errors: command.errors}, status: :unprocessable_entity
    end
  end  
end
