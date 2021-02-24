class PatternsController < ApplicationController

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
        params.require(:pattern).permit(:name, :description, :family_id)
    end
end
