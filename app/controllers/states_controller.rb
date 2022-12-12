class StatesController < ApplicationController
  def fetch_country_states
    # debugger
    # @state = State.all
    @state = State.all.where(country_id: params[:id].to_i)
  end
end
