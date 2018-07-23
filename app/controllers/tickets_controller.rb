class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_train, only: %i[new create]
  before_action :find_ticket, only: %i[show delete]

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new(base_station_id: params[:base_station_id], end_station_id: params[:end_station_id])
  end

  def create
    @ticket = @train.tickets.new(ticket_params)
    @ticket.user = User.first

    if @ticket.save

      redirect_to tickets_url, notice: 'Билет создан.'
    else
      render :new
    end
  end

  def show
    @ticket = current_user.ticket.find(params[:id])
  end

  def destroy
    @ticket = current_user.tickets.find(params[:id])
    @ticket.destroy
    redirect_to tickets_url, 'Ticket was successfuly deleted'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_first_name, :user_last_name, :user_middle_name, :user_passport, :base_station_id, :end_station_id)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end

  def find_ticket
    @ticket = current_user.tickets.find(params[:id])
  end
end
