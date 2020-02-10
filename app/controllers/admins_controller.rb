# frozen_string_literal: true

class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end
end
