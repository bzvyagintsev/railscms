class PagesController < ApplicationController

		before_action :set_page, only: [:show]

		def index
			@pages = Page.all
		end

		def show
		end



		private

	# Поиск страницы по friendly_id и редирект с id на friendly_id
	  def set_page
	    # @page = Page.find(params[:id])
	    @page = Page.friendly.find(params[:id])
	    redirect_to action: :show, id: @page.friendly_id, status: 301 unless @page.friendly_id == params[:id] 
	  end

end
