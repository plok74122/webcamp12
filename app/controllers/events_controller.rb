class EventsController < ApplicationController
  before_action :set_event, :only => [:show, :edit, :update, :destroy]

  def index
    @events = Event.includes(:category).page(params[:page]).per(20)
    respond_to do |format|
      format.html { render "index" }
      format.json { render :json => @events }
    end
  end

  def new
    @event = Event.new
  end

  def create
    byebug
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "新增成功"
      redirect_to events_path()
    else
      render "new"
    end
  end

  def show
    @title = @event.name
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "更新成功"
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "刪除成功"
    redirect_to events_path
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :category_id, :capacity, :group_ids => [])
  end
end
