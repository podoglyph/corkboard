class Api::V1::IndustryController < ApplicationController
  def index
    render json: Industry.all
  end
end