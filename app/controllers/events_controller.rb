class EventsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @event= Event.new
  end

  def create
    group = Group.find(params[:group_id])
    event = Event.create(event_params)
    SampleMailer.send_when_update(event).deliver
    redirect_to group_event_path(event)
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :content).merge(group_id: params[:group_id])
  end


end
