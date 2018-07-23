class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def search
    @base_station = RailwayStation.find(params[:base_station])
    @end_station = RailwayStation.find(params[:end_station])
    @routes = Route.searched_routes(@base_station, @end_station)
  end
end
