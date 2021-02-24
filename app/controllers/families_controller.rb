class FamiliesController < ApplicationController
  def index
    @families = Family.all
  end

  # def show
  #  @family = Family.find(params[:id])
  #  @season = Season.find(params[:season_id])
  # end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(cloth_params)
    if @family.save
      redirect_to new_family_path(@family)
    else
      render "new"
    end
  end

	def edit
    @family = Family.find(params[:id])
  end

	def update
    @family = Family.find(params[:id])
    @family.update(family_params)
    redirect_to family_path(family)
  end

	def destroy
		@family = Family.find(params[:id])
		@family.destroy
		redirect_to families_path
	end


  private

  def family_params
    params.require(:family).permit(:name)
  end
end
