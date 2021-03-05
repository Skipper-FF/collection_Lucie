class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :get_seasons

  def get_seasons
    @all_seasons = Season.all
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
