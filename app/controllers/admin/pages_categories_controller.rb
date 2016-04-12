class Admin::PagesCategoriesController < Admin::BaseController

		before_action :set_pages_category, only: [:show, :edit, :update, :destroy]

		def index
			@pages_categories = PagesCategory.all.paginate(:per_page => 2, :page => params[:page])
		end

		def show
		end

		def new
			@pages_category = PagesCategory.new
		end

		def edit
			
		end

		def create
			@pages_category = PagesCategory.new(pages_category_params)

		    respond_to do |format|
		      if @pages_category.save
		        format.html { redirect_to admin_pages_categories_path, :flash => { success: "Страница успешно создана"} }
		        format.json { render :show, status: :created, location: @pages_category }
		      else
		        format.html { render :new }
		        format.json { render json: @pages_category.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def update
		    respond_to do |format|
		      if @pages_category.update(pages_category_params)

		        format.html { redirect_to admin_pages_categories_path, :flash => { success: "Страница успешно обновлена"} }
		        format.json { render :show, status: :created, location: @pages_category }
		      else
		        format.html { render :new }
		        format.json { render json: @pages_category.errors, status: :unprocessable_entity }
		      end
		    end
		end

		def destroy
			@pages_category.destroy
			flash[:danger] = "Страница удалена"
			respond_to do |format|
		        format.html { redirect_to admin_pages_categories_url}
		        format.json { render :show, status: :created, location: @pages_category }
		    end
		end

		def destroy_multiple
			if params[:pages_categories].present?
				PagesCategory.destroy(params[:pages_categories])

				respond_to do |format|
				 format.html { redirect_to admin_pages_categories_path, :flash => { danger: "Страницы удалены"}  }
				 format.json { head :no_content }
				end
			else
				respond_to do |format|
				 format.html { redirect_to admin_pages_categories_path, :flash => { danger: "Вы не выбрали ни одной страницы"}  }
				 format.json { head :no_content }
				end
			end
		end

		private

		def pages_category_params
			params.require(:pages_category).permit(:title, :body, :slug)
		end

			# Поиск страницы по friendly_id и редирект с id на friendly_id
		def set_pages_category
	 	   @pages_category = PagesCategory.find(params[:id])
		    # @pages_category = Page.friendly.find(params[:id])
		    # redirect_to action: :show, id: @pages_category.friendly_id, status: 301 unless @pages_category.friendly_id == params[:id] 
		end

 	end