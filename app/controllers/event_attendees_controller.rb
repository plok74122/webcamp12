class EventAttendeesController < ApplicationController
  before_action :set_event

  def index
    @attendees = @event.attendees
  end

  def new
    @attendee = @event.attendees.new
  end

  def create
    @attendee = @event.attendees.new(attendee_params)
    if @attendee.save
      flash[:notice] = "新增成功"
      redirect_to event_attendees_path(@event)
    else
      render "new"
    end
  end

  def show
    @attendee = @event.attendees.find(params[:id])
  end

  def edit
    @attendee = @event.attendees.find(params[:id])
  end

  def update
    @attendee = @event.attendees.find(params[:id])
    if @attendee.update(attendee_params)
      flash[:notice] = "更新成功"
      redirect_to event_attendees_path(@event)
    else
      render "edit"
    end
  end

  def destroy
    @attendee = @event.attendees.find(params[:id])
    @attendee.destroy
    flash[:notice] = "刪除成功"
    redirect_to event_attendees_path(@event)
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def attendee_params
    params.require(:attendee).permit(:username)
  end
end
