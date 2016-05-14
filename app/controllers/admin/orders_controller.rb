class Admin::OrdersController < Admin::BaseController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all.paginate(:per_page => 25, :page => params[:page])
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create!(order_params)

    # 	order_line_item_params[:products].each do |product|
    #     @order.create_line_item(product.second)
    # end

    order_line_item_params[:products].values.each do |value|
      @order.create_line_item(value[:product_id], value[:quantity])
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to admin_orders_path, :flash => { success: 'Заказ успешно оформлен' } }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update!(order_params)
        @order.line_items.destroy_all
        order_line_item_params[:products].values.each do |value|
          @order.create_line_item(value[:product_id], value[:quantity])
        end

        format.html { redirect_to admin_orders_path, :flash => { success: "Заказ успешно обновлен"} }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_multiple
    if params[:orders].present?
      Order.destroy(params[:orders])
      respond_to do |format|
        format.html { redirect_to admin_orders_path, :flash => { danger: "Заказы удалены"}  }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_orders_path, :flash => { danger: "Вы не выбрали ни одного заказа"}  }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :user_id, :name, :email, :telephone, :city, :street, :house, :housing, :flat, :shipment_method_id, :payment_method_id, :accept_rules, :comment)
  end

  def order_line_item_params
    params.require(:line_items).tap do |whitelisted|
      whitelisted[:products] = params[:line_items][:products] if params[:line_items][:products]
    end
  end
end
