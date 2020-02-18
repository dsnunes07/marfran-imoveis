class ApplicationController < ActionController::Base
  def index
    split_params
    @q = RealEstate.showing.ransack(params[:q])
    @q.build_grouping unless @q.groupings.any?
    @renting = RealEstate.showing.renting.sample(6)
    @selling = RealEstate.showing.selling.sample(6)
    if params[:q]
      @real_estates = @q.result(distinct: true).includes(:address)
      @real_estates = @real_estates.page(params[:page])
      render :search_results
    end
    
  end

  def split_params
    if params[:q]
      params[:q][:name_or_description_cont_any] = params[:q][:name_or_description_cont_any].split()
      params[:q][:address_street_or_address_number_or_address_cep_or_address_city_or_address_state_cont_any] = params[:q][:address_street_or_address_number_or_address_cep_or_address_city_or_address_state_cont_any].split()
    end
  end
end
