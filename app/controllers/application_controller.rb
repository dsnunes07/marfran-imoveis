class ApplicationController < ActionController::Base
  def index
    @q = RealEstate.ransack(params[:q])
    @real_estates = @q.result(distinct: true)
    binding.pry
  end
end
