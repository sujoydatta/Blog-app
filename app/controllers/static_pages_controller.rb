class StaticPagesController < ApplicationController
  def home
  	@entries = current_user.entries.build if logged_in?
  end
end
