class Admin::ProductsController < Admin::BaseController

		before_action :set_product, only: [:show, :edit, :update, :destroy]

		def index
			@products = Product.all.paginate(:per_page => 2, :page => params[:page])
		end

		def show
		end

		def new
			@product = Product.new
		end

		def edit
			
		end

		def create
			@product = Product.new(product_params)

		    respond_to do |format|
		      if @product.save
		        format.html { redirect_to admin_product_path(@product), :flash => { success: "Товар успешно создан"} }
		        format.json { render :show, status: :created, location: @product }
		      else
		        format.html { render :new }
		        format.json { render json: @product.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def update
		    respond_to do |format|
		      if @product.update(product_params)

		        format.html { redirect_to admin_product_path(@product), :flash => { success: "Товар успешно обновлен"} }
		        format.json { render :show, status: :created, location: @product }
		      else
		        format.html { render :new }
		        format.json { render json: @product.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def destroy
			@product.destroy
			flash[:danger] = "Товар удален"
			respond_to do |format|
		        format.html { redirect_to admin_products_url}
		        format.json { render :show, status: :created, location: @product }
		    end
		end

		def destroy_multiple
			if params[:products].present?
				Product.destroy(params[:products])

				respond_to do |format|
				 format.html { redirect_to admin_products_path, :flash => { danger: "Товары удалены"}  }
				 format.json { head :no_content }
				end
			else
				respond_to do |format|
				 format.html { redirect_to admin_products_path, :flash => { danger: "Вы не выбрали ни одного товара"}  }
				 format.json { head :no_content }
				end
			end
		end

		private

		def product_params
			params.require(:product).permit(:title, :products_category_id, :price, :description, :cover, :active, :slug, :seo_title, :seo_description)
		end

			# Поиск страницы по friendly_id и редирект с id на friendly_id
		def set_product
	 	   @product = Product.find(params[:id])
		    # @product = Product.friendly.find(params[:id])
		    # redirect_to action: :show, id: @product.friendly_id, status: 301 unless @product.friendly_id == params[:id] 
		end

end