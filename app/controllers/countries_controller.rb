class CountriesController < ApplicationController
  def index
    @countries = Country.all
    @q = Country.ransack(params[:q])
    @pagy, @countries = pagy_countless(@q.result(distinct: true).order(created_at: :asc), items: 4)
    respond_to do |format|
      format.html
      format.pdf do
        # render pdf: "Countries.pdf", template: "countries/index.html.erb" # Excluding ".pdf" extension.
        render pdf: "Countries.pdf", template: "countries/index", formats: [:html]

      end
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def show
    @country = Country.find(params[:id])
  end

  def new
    @country = Country.new
  end
  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to country_path(@country)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @country = Country.find(params[:id])
    if @country.update(country_params)
      redirect_to country_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @country = Country.find(params[:id])
    @country.destroy
    redirect_to countries_path, status: :see_other
  end

  private
  def country_params
    params.require(:country).permit(:country_name)
  end
end
