class ProductsController < ApplicationController

		before_action :set_product, only: [:show]

		def index
			@products = Product.all
		end

		def show
		end



		private

	# Поиск страницы по friendly_id и редирект с id на friendly_id
	  def set_product
	    # @product = Product.find(params[:id])
	    @product = Product.friendly.find(params[:id])
	    redirect_to action: :show, id: @product.friendly_id, status: 301 unless @product.friendly_id == params[:id] 
	  end

end
