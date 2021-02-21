class TicketsController < ApplicationController
 before_action :authenticate_user!
  load_and_authorize_resource

  # GET /tickets
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  def create
    @ticket.user_id = current_user.id
    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  private
    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:name, :description, :user_id)
    end
end
