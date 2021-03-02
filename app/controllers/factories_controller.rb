class FactoriesController < ApplicationController
	def index
		# Find l'instance de la famille qui correspond aux params de id
		family = Family.find(params[:id])
		@factories = family.factories

		respond_to do |format|
			format.json {render json: { html: render_to_string(partial: "clothes/factories_input", formats: :html ) }}
		end
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
