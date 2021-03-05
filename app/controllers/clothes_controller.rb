class ClothesController < ApplicationController
  def index
    @season = Season.find(params[:season_id])
    if params[:query].present?
      @clothes = Clothe.search_by_name_and_reference(params[:query])
    else
      @clothes = @season.clothes
    end
  end

  def show
    @clothe = Clothe.find(params[:id])
    @season = Season.find(params[:season_id])
  end

  def new
    @clothe = Clothe.new
    @patterns = Pattern.all
    @factories = Factory.all
    @season = Season.find(params[:season_id])
    @families = Family.all
    @components = Component.all
    @main_fabric = Component.where(element_type: "Main fabric")
    @secondary_fabric = Component.where(element_type: "Secondary fabric")
    @trim = Component.where(element_type: "Trim")
    @brand_trim = Component.where(element_type: "Brand trim")
    @clothe.technical_details.build
  end

  def create
    @clothe = Clothe.new(clothe_params)
    @clothe.family = Family.find(params[:clothe][:family])
    @patterns = @clothe.family.patterns
    @components = Component.all
    @season = Season.find(params[:season_id])
    @clothe.season = @season
    @clothe.total_cost = @clothe.confection_cost # faire que total_cost = confection_cost
    if @clothe.save
      @technical_details = technical_details_params[:technical_details_attributes].values
      @technical_details.each do |detail|
        TechnicalDetail.create(
          clothe_id: @clothe.id,
          component_id: detail[:component],
          quantity: detail[:quantity]
        )
      end
      # @technical_detail = TechnicalDetail.create(
      #   clothe_id: @clothe.id,
      #   component_id: technical_details_params[:technical_details_attributes]["0"][:component],
      #   quantity: technical_details_params[:technical_details_attributes]["0"][:quantity]
      # )
      redirect_to season_clothe_path(@season, @clothe) # plutôt renvoyer vers la SHOW de clothe
    else
      render "new"
    end
  end

  def update
    @clothe = Clothe.find(params[:id])
    @clothe.update(clothe_params)
    if @clothe.save
      redirect_to season_clothe_path(@clothe.season, @clothe)
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

  def technical_details_params
    params.require(:clothe).permit(technical_details_attributes: [:component, :quantity])
  end
end
