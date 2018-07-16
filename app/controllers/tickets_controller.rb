class TicketsController < ApplicationController
  before_action :find_train, only: %i[new create]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @start_station = RailwayStation.find(params[:base_station])
    @end_station = RailwayStation.find(params[:end_station])
  end

  def create
    @ticket = @train.tickets.new(ticket_params.slice(:user_first_name, :user_passport))
    @ticket.base_station_id = ticket_params[:base_station].to_i
    @ticket.end_station_id = ticket_params[:end_station].to_i
    @ticket.user = User.first

    if @ticket.save
      redirect_to tickets_path, notice: 'Билет создан.'
    else
      redirect_to new_train_ticket_path(@train)
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_first_name, :user_last_name, :user_middle_name, :user_passport, :base_station, :end_station)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end
end
