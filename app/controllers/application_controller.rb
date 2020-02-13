class ApplicationController < ActionController::Base
    def index
      @real_estates = RealEstate.all
    end
end
