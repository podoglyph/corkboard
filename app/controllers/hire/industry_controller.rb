class Hire::IndustryController < ApplicationController

  def show
    @industry = Industry.find(params[:id])
  end

end
