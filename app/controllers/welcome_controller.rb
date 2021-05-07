class WelcomeController < ApplicationController
  skip_before_action :authenticate
  
  def index
    @events = Event.page(params[:page]).per(10).where("start_at > ?", Time.zone.now).order(:start_at)
    # @event_search_form = EventSearchForm.new(event_search_form_params)
    # @events = @event_search_form.search
  end

  private
  def event_search_form_params
    params.fetch(:event_search_form, {}).permit(:keyword, :start_at).merge(page: params[:page])
  end
end
