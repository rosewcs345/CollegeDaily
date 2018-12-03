class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]        
  before_filter :set_user_and_event # think about for which actions this is necessary
  
  # GET /bookings/new
  def new
    @booking = @event.bookings.build
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @current_user.bookings << @event.bookings.build(booking_params)
    # Add logic for what to do if unsuccessful, go back to form
    flash[:notice] = 'Booking was successfully created.'    
    redirect_to event_path(@event)

    #respond_to do |format|
    #  if @booking.save
    #    format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
    #    format.json { render :show, status: :created, location: @booking }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @booking.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to event_path(@event), notice: 'Booking was successfully updated.' }
        #format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def set_user_and_event
    unless @current_user
      flash[:warning] = 'You must be logged in to create a booking' 
      redirect_to welcome_login_page_path
    end
    #********************************************************************
    @event = Event.find(params[:event_id])
    #Insert code to make sure that User isn't signing up too late
    unless (Date.today <= @event.date) # && Time.zone.now < @event.end_time ##fix this!!
      flash[:warning] = 'Booking must be for an upcoming event'  
      redirect_to events_path
    end
    @user = @current_user
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:event_id, :user_id, :vehicle, :usable_seats)
  end
end  
      