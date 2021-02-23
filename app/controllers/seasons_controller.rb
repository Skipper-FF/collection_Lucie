class SeasonsController < ApplicationController
	def index
	 @seasons = Season.all
	end

	def show
	  @season = Season.find(params[:id])
	end

	def new
	  @season = Season.new
	end

	def create
	@season = Season.new(season_params)
		if @season.save
			redirect_to season_path(@season)
		else
			render "new"
		end
	end

	private

	def season_params
		params.require(:season).permit(:name, :beginning_date, :ending_date)
	end
end
