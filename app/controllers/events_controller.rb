class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]

  def index
    @events = Event.all
    #@upcoming_events = Event.upcoming_events
    #@past_events = Event.past_events
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_upcoming
    @upcoming_events = Event.upcoming_events
  end

  def show_past
    @past_events = Event.past_events
  end

  private

  def event_params
    params.require(:event).permit(:event)
  end
end
