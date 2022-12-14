class StatesController < ApplicationController
  def fetch_country_states
    @state = State.all.where(country_id: params[:id].to_i)
  end

  def index
    @states = State.all
  end

  def edit
    @state = State.find(params[:id])
  end

  def show
    @state = State.find(params[:id])
  end

  def new
    @state = State.new
  end
  def create
    @state = State.new(state_params)
    if @state.save
      redirect_to state_path(@state)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @state = State.find(params[:id])
    if @state.update(state_params)
      redirect_to state_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @state = State.find(params[:id])
    @state.destroy
    redirect_to states_path, status: :see_other
  end

  private
  def state_params
    params.require(:state).permit(:state_name, :country_id)
  end
end
