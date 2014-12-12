class ProvidersController < ApplicationController

  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
    @review = @provider.reviews.build
  end
  
  def new
    @provider = Provider.new
  end
  
  def create
    @provider = Provider.new(provider_params)
      if @provider.save
        redirect_to @provider, notice: "D.O.C Successfully Added!"
      else
        flash[:message] = "Something did not validate"
        render 'new'
    end
  end
  
  def edit
  end

  def delete
  end

private
  def provider_params
    params.require(:provider).permit(:first_name, :last_name, :full_address, :address_line1, :address_line2, :city, :province, :area_code, :phone_number, :type, :waiting_period)
  end

end