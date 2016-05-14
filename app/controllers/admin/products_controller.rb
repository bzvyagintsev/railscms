class Admin::ProductsController < Admin::BaseController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # before_action :ensure_not_referenced_by_any_line_item, only: [:destroy_multiple]

  def index
    @all_products = Product.all.paginate(:per_page => 50, :page => params[:page])
    @active_products = Product.active.paginate(:per_page => 2, :page => params[:page])
    @not_active_products = Product.not_active.paginate(:per_page => 2, :page => params[:page])
  end

  def show
  end

  def new
    @product = Product.new
    @product.assets.build
  end

  def edit

  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path, :flash => { success: "Товар успешно создан"} }
        format.json { render @product, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)

        format.html { redirect_to admin_products_path, :flash => { success: "Товар успешно обновлен"} }
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
        format.json { render json: 'Ошибка', status: :unprocessable_entity }
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :title,
      :products_category_id,
      :price,
      :description,
      :length,
      :height,
      :width,
      :weight,
      :cover,
      :active,
      :slug,
      :seo_title,
      :seo_description,
      :assetable
    )

  end

  # Поиск страницы по friendly_id и редирект с id на friendly_id
  def set_product
    @product = Product.find(params[:id])
    # @product = Product.friendly.find(params[:id])
    # redirect_to action: :show, id: @product.friendly_id, status: 301 unless @product.friendly_id == params[:id]
  end

  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  # def ensure_not_referenced_by_any_line_item
  # 	@products = Product.find(params[:products])
  # 	if @products.each do |p|
  # 		p.line_items.empty?
  # 		return true
  # 	end

  # 	else
  # 		flash[:danger] = "С некоторыми товарами связаны товарные позиции"
  # 		return false
  # 	end
  # end

end
