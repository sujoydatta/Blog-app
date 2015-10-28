class StaticPagesController < ApplicationController
  def home
  	@entries = current_user.entries.build if logged_in?
  	if logged_in?
  		@feed_items = current_user.feed.paginate(page: params[:page],per_page: 10)

  	else
  		@feed_items=Entry.paginate(page: params[:page],per_page: 10)
  	end
  end
end
