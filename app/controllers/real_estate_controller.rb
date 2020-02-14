class RealEstateController < ApplicationController
  layout 'admins'
  def index
    @real_estates = RealEstate.order(:created_at).page(params[:page])
  end

  def new
    @real_estate = RealEstate.new
  end

  def show
    @real_estate = RealEstate.find(params[:id])
  end

  def create
    binding.pry
    address = Address.new(address_params)
    if address.save
      real_estate = RealEstate.new(real_estate_params)
      real_estate.address_id = address.id
      real_estate.save
    end
    redirect_to admins_path
  end

  def edit
    @real_estate = RealEstate.find(params[:id])
    @address = Address.find(@real_estate.address_id)
  end

  def update
    attachments_id_to_delete = params[:real_estate][:deleted_values].split(',').map(&:to_i)
    ActiveStorage::Attachment.find(attachments_id_to_delete).map(&:purge)
    Address.update(params[:real_estate][:address_id], address_params)
    RealEstate.update(params[:id], real_estate_params)
    respond_to do |format|
      format.js { redirect_to list_real_estate_path }
    end
  end

  def destroy
    RealEstate.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def real_estate_params
    params.require(:real_estate).permit(:name, :real_estate_type, :rooms,
                                        :showing, :selling, :renting, :sell_price,
                                        :rent_price, :description, images: [])
  end

  def address_params
    params.require(:real_estate).permit(:street, :number, :cep, :city, :state)
  end
end
