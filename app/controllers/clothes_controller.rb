class ClothesController < ApplicationController
  def index
    @season = Season.find(params[:season_id])
    if params[:query].present?
      @clothes = Clothe.search_by_name_and_reference(params[:query])
    else
      @clothes = Clothe.all
    end
  end

  def show
    @clothe = Clothe.find(params[:id])
    @season = Season.find(params[:season_id])
  end

  def new
    @clothe = Clothe.new
    @clothe.family = Family.find(params[:family])
    @patterns = @clothe.family.patterns
    @season = Season.find(params[:season_id])
    @families = Family.all
  end

  def create
    @clothe = Clothe.new(clothe_params)
    @clothe.family = Family.find(params[:clothe][:family_id])
    @patterns = @clothe.family.patterns

    @season = Season.find(params[:season_id])
    @clothe.season = @season
    if @clothe.save
      redirect_to season_clothes_path(@clothe.season)
    else
      raise
      render "new"
    end
  end

  def add
    @families = Family.all
    @clothe = Clothe.new
    @season = Season.find(params[:season_id])
    @clothe.season = @season
  end

  private

  def clothe_params
    params.require(:clothe).permit(:factory_id, :season_id, :pattern_id, :name, :reference, :quantity, :confection_cost, :total_cost, :selling_price)
  end
end
