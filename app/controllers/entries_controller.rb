class EntriesController < ApplicationController

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
  def destroy
  end

  private

    def entry_params
      params.require(:entry).permit(:title, :content)
    end
end
