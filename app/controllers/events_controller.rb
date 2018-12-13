class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :set_user
      

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
   
    
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @bookings = @event.bookings
    @event = set_event
  end

  # GET /events/new
  def new
    @event = @user.events.build(user_id: @user.id)
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    p params
    
    @event = Event.new(event_params)
    @event.user_id = @current_user.id
    
    # get only hours and minutes
    @event.start_time_string = Event.format_time(@event.start_time);
    @event.end_time_string = Event.format_time(@event.end_time);

    p @event
    
    # @booking = { :event_id => params["event_id"], :user_id => params["user_id"], :usable_seats => 0, :vehicle => true }
    customParam = { event_id: @event.id, user_id: @event.user_id, usable_seats: 0, vehicle: false }
    @current_user.bookings << @event.bookings.build(customParam)
    
    #You will have to edit this part as needed
    respond_to do |format|
      if @event.save

        # change all refrences to "Activity Event" to "Outdoor Event"
        if @event.category == "Activity Event"
           format.html { redirect_to new_event_booking_path(@event), notice: 'Event was successfully created.' }
        else
          format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        end
        

        format.json { render :show, status: :created, location: @event }
        
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
    
    
    
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    # Modify as needed
    
  
    
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_path(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = set_event
    @event.destroy
    flash[:notice] = "Event deleted."  
    redirect_to events_path 
    # Modify as needed:
    #  respond_to do |format|
    #    format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    #    format.json { head :no_content }
    #  end
  end
        
  protected

  def set_user
    unless @current_user
      flash[:warning] = 'You must be logged in to create an event or booking' 
      redirect_to welcome_login_page_path
    end
    @user = @current_user
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :category, :host, :location, :description, :date, 
    :start_time, :end_time, :start_time_string, :end_time_string, :traits, :user_id)
  end
  
  
end
      
