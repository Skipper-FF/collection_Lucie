class FamiliesController < ApplicationController
  # def index
  #  @families = Family.all
  # end

  # def show
  #  @family = Family.find(params[:id])
  #  @season = Season.find(params[:season_id])
  # end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to new_family_path(@family)
    else
      render "new"
    end
  end

  private

  def family_params
    params.require(:family).permit(:name)
  end
end
