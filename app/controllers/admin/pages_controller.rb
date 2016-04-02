module Admin
	# class PagesController < ApplicationController
	class PagesController < Admin::BaseController

		before_action :set_page, only: [:show, :edit, :update, :destroy]

		def index
			@pages = Page.all
		end

		def show
		end

		def new
			@page = Page.new
		end

		def edit
			
		end

		def create
			@page = Page.new(page_params)

		    respond_to do |format|
		      if @page.save
		        format.html { redirect_to admin_page_path(@page), :flash => { success: "Страница успешно создана"} }
		        format.json { render :show, status: :created, location: @page }
		      else
		        format.html { render :new }
		        format.json { render json: @page.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def update
		    respond_to do |format|
		      if @page.update(page_params)

		        format.html { redirect_to admin_page_path(@page), :flash => { success: "Страница успешно обновлена"} }
		        format.json { render :show, status: :created, location: @page }
		      else
		        format.html { render :new }
		        format.json { render json: @page.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def destroy
			@page.destroy
			flash[:danger] = "Страница удалена"
			respond_to do |format|
		        format.html { redirect_to admin_pages_url}
		        format.json { render :show, status: :created, location: @page }
		    end
		end

		private

		def page_params
			params.require(:page).permit(:title, :body, :slug)
		end

			# Поиск страницы по friendly_id и редирект с id на friendly_id
		def set_page
	 	   @page = Page.find(params[:id])
		    # @page = Page.friendly.find(params[:id])
		    # redirect_to action: :show, id: @page.friendly_id, status: 301 unless @page.friendly_id == params[:id] 
		end

 	end
end
