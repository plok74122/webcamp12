class EventsController < ApplicationController
  before_action :set_event, :only => [:show, :edit, :update, :destroy]

  def index
    if params[:keyword]
      @events = Event.where('name like ?', "%#{params[:keyword]}%")
    else
      @events = Event.all
    end

    if params[:order] == "id"
      @events = @events.order("id")
    elsif params[:order] == "name"
      @events = @events.order("name")
    end
    
    @events = @events.includes(:category).page(params[:page]).per(20)
    respond_to do |format|
      format.html { render "index" }
      format.json { render :json => @events }
    end
  end

  def new
    @event = Event.new
  end

  def create
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

  def bulk_update
    ids = Array(params[:ids])
    if params[:commit] == "update"
      Event.where(:id => ids).update_all(:is_public => true)
    elsif params[:commit] == "delete"
      Event.where(:id => ids).destroy_all
    end
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
