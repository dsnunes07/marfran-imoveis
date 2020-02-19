class RealEstateController < ApplicationController
  require 'mini_magick'
  layout 'admins'
  def index
    @real_estates = RealEstate.order(:updated_at).page(params[:page])
  end

  def new
    @real_estate = RealEstate.new
  end

  def show
    @real_estate = RealEstate.find(params[:id])
  end

  def create
    resize_images
    real_estate = RealEstate.new(real_estate_params)
    if real_estate.save
      address = Address.new(address_params)
      address.real_estate = real_estate
      address.save
    end
    redirect_to real_estate_index_path
  end

  def edit
    @real_estate = RealEstate.find(params[:id])
    @address = @real_estate.address
  end

  def update
    resize_images
    if params[:real_estate][:deleted_values]
      attachments_id_to_delete = params[:real_estate][:deleted_values].split(',').map(&:to_i)
      ActiveStorage::Attachment.find(attachments_id_to_delete).map(&:purge)
    end
    Address.update(params[:real_estate][:address_id], address_params)
    RealEstate.update(params[:id], real_estate_params)
    redirect_to real_estate_index_path
  end

  def destroy
    RealEstate.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def real_estate_params
    params.require(:real_estate).permit(:name, :real_estate_type, :rooms, :bathrooms,
                                        :showing, :selling, :renting, :sell_price,
                                        :rent_price, :description, :area, images: [])
  end

  def address_params
    params.require(:real_estate).permit(:street, :number, :cep, :city, :state)
  end

  def resize_images
    return unless params[:real_estate][:images].present?

    params[:real_estate][:images].each do |image|
      mini_image = MiniMagick::Image.new(image.tempfile.path)
      mini_image.resize '1200x1200'
    end
  end
end
