class FactoriesController < ApplicationController
	def index
		@factories = Factory.all
	end
	
	def show
		@factories = Factory.find(params[:id])

	end
	
	def new
		@factory = Factory.new
	end

	def create
		@factory = Factory.new(factory_params)
		if @factory.save
			redirect_to new_factory_path(@factory)
		else
			render "new"
		end
	end

	def edit
    @factory = Factory.find(params[:id])
  end

	def update
    @factory = Factory.find(params[:id])
    @factory.update(factory_params)
    redirect_to factory_path(factory)
  end

	def destroy
		@factory = Factory.find(params[:id])
		@factory.destroy
		redirect_to factories_path
	end
		
	private

	def factory_params
		params.require(:factory).permit(:name, :address, :speciality, :production_capacity, :moq, :rating)
	end
end
