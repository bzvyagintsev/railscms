class ProductsCategoriesController < ApplicationController

		before_action :set_products_category, only: [:show]

		def index
			@products_categories = ProductsCategories.all
		end

		def show
    		@products = @products_category.products.active.order('title ASC')
		end



		private

	# Поиск страницы по friendly_id и редирект с id на friendly_id
	  def set_products_category
	    # @products_category = ProductsCategories.find(params[:id])
	    @products_category = ProductsCategory.friendly.find(params[:id])
	    redirect_to action: :show, id: @products_category.friendly_id, status: 301 unless @products_category.friendly_id == params[:id] 
	  end

end
