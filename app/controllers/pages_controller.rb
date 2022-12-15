class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home instructions]

  def home
    flash[:notice] = "Click <a class='instruction-link' href='/instructions'>here</a> to see the instructions"
  end

  def instructions; end
end
