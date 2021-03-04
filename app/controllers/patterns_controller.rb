class PatternsController < ApplicationController

    def index
        # Find l'instance de la famille qui correspond aux params de id
        family = Family.find(params[:id])
        @patterns = family.patterns

        respond_to do |format|
            format.json {render json: { html: render_to_string(partial: "clothes/patterns_input", formats: :html ) }}
          end
    end

    def new
        @pattern = Pattern.new
        @families = Family.all
    end

    def create
        @pattern = Pattern.new(pattern_params)
        if @pattern.save
        redirect_to root_path
        else 
        render 'new'
        end
    end

    def edit
        @pattern = Pattern.find(params[:id])
    end

    def update
        @pattern = Pattern.find(params[:id])
        @pattern.update(pattern_params)
        redirect_to root_path
    end

    def destroy
        @pattern = Pattern.find(params[:id])
        @pattern.destroy
    end

    private

    def pattern_params
        params.require(:pattern).permit(:name, :description, :family_id, :photo)
    end
end
