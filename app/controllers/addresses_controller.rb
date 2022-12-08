class AddressesController < ApplicationController

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @address = @user.addresses.build
  end

  def create
    # debugger
    @user = User.find(params[:user_id])
    @address = @user.addresses.new(address_params)
    if @address.save
      redirect_to welcome_home_path , notice: 'Address Created Successfully'
    else
      # debugger
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @user = User.find(params[:user_id])
  end
  def update
  end
  def destroy
    debugger
    @user = User.find(params[:user_id])
    @user.addresses.destroy
    redirect_to showbh_user_path(current_user.id) , notice: "Address deleted sucessfully"
  end

  private
  def address_params
    params.require(:address).permit(:address1 ,:address2, :zipcode, :city, :state, :country)
  end
end
