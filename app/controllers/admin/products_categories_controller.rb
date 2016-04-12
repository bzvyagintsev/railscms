class Admin::ProductsCategoriesController < Admin::BaseController

		before_action :set_products_category, only: [:show, :edit, :update, :destroy]

		def index
			@products_categories = ProductsCategory.all.paginate(:per_page => 2, :page => params[:page])
		end

		def show
		end

		def new
			@products_category = ProductsCategory.new
		end

		def edit
			
		end

		def create
			@products_category = ProductsCategory.new(products_category_params)

		    respond_to do |format|
		      if @products_category.save
		        format.html { redirect_to admin_products_categories_path, :flash => { success: "Категория успешно создана"} }
		        format.json { render :show, status: :created, location: @products_category }
		      else
		        format.html { render :new }
		        format.json { render json: @products_category.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def update
		    respond_to do |format|
		      if @products_category.update(products_category_params)

		        format.html { redirect_to admin_products_categories_path, :flash => { success: "Категория успешно обновлена"} }
		        format.json { render :show, status: :created, location: @products_category }
		      else
		        format.html { render :new }
		        format.json { render json: @products_category.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def destroy
			@products_category.destroy
			flash[:danger] = "Категория удалена"
			respond_to do |format|
		        format.html { redirect_to admin_products_categories_url }
		        format.json { render :show, status: :created, location: @products_category }
		    end
		end

		def destroy_multiple
			if params[:products_categories].present?
				ProductsCategory.destroy(params[:products_categories])

				respond_to do |format|
				 format.html { redirect_to admin_products_categories_path, :flash => { danger: "Категории удалены"}  }
				 format.json { head :no_content }
				end
			else
				respond_to do |format|
				 format.html { redirect_to admin_products_categories_path, :flash => { danger: "Вы не выбрали ни одной категории"}  }
				 format.json { head :no_content }
				end
			end
		end

		private

		def products_category_params
			params.require(:products_category).permit(:title, :description, :cover, :slug, :seo_title, :seo_description)
		end

			# Поиск страницы по friendly_id и редирект с id на friendly_id
		def set_products_category
	 	   @products_category = ProductsCategory.find(params[:id])
		    # @products_category = ProductsCategory.friendly.find(params[:id])
		    # redirect_to action: :show, id: @products_category.friendly_id, status: 301 unless @products_category.friendly_id == params[:id] 
		end

end

