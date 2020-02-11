class RealEstateController < ApplicationController
  def index
    @real_estates = RealEstate.all
  end

  def new
    @real_estate = RealEstate.new
  end

  def create
    real_estate = RealEstate.new(real_estate_params)
    if real_estate.save
      flash[:alert] = 'Imóvel adicionado'
    else
      flash[:danger] = "Imóvel não foi adicionado \n #{real_estate.errors}"
    end
    redirect_to admins_path
  end

  def edit
    @real_estate = RealEstate.find(params[:id])
  end

  def update
    RealEstate.update(params[:id], real_estate_params)
    redirect_to list_real_estate_path
  end

  def destroy
    RealEstate.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def real_estate_params
    params.require(:real_estate).permit(:name, :real_estate_type, :rooms, :showing)
  end
end
