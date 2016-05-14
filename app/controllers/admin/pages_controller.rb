module Admin
  # class PagesController < ApplicationController
  class PagesController < Admin::BaseController

    before_action :set_page, only: [:show, :edit, :update, :destroy]

    def index
      @pages = Page.all.paginate(:per_page => 2, :page => params[:page])
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
          format.html { redirect_to admin_pages_path, :flash => { success: "Страница успешно создана"} }
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

          format.html { redirect_to admin_pages_path, :flash => { success: "Страница успешно обновлена"} }
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

    def destroy_multiple
      if params[:pages].present?
        Page.destroy(params[:pages])

        respond_to do |format|
          format.html { redirect_to admin_pages_path, :flash => { danger: "Страницы удалены"}  }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to admin_pages_path, :flash => { danger: "Вы не выбрали ни одной страницы"}  }
          format.json { head :no_content }
        end
      end
    end

    private

    def page_params
      params.require(:page).permit(:title, :pages_category_id, :body, :active, :slug, :seo_title, :seo_description)
    end

    # Поиск страницы по friendly_id и редирект с id на friendly_id
    def set_page
      @page = Page.find(params[:id])
      # @page = Page.friendly.find(params[:id])
      # redirect_to action: :show, id: @page.friendly_id, status: 301 unless @page.friendly_id == params[:id]
    end

  end
end
