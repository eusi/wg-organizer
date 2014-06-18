class ImprintController < ActionController::Base
	layout :choose_layout
	
  def index
  end

  def disclaimer
  end

  private

  #if user is logged in choose application-layout, otherwise home-layout
  def choose_layout
    user_signed_in? ? "application" : "home"
  end
end