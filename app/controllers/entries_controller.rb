class EntriesController < ApplicationController

  before_filter :foo

  def foo

  end

  def create
  	@entries = current_user.entries.build(entry_params)
    if @entries.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
    @entries= Entry.find(params[:id])
    @comment= @entries.comments.paginate(page: params[:page],per_page: 10)
    @comments= @entries.comments.build if logged_in?
  
  end

  def destroy
  end

  private

    def entry_params
      params.require(:entry).permit(:title, :content)
    end
end
