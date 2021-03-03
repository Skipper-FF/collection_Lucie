class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if current_user
      @latest_season = current_user.seasons.last
    end
  end
end
