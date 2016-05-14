class Admin::AssetsController < Admin::BaseController
  def index
    @assets = Asset.all
  end

  def create
    @context = context

    if @context == nil
      @asset = Asset.new(asset_params)
    else
      @asset = @context.asset.new(asset_params)
    end

    # if @asset.save
    #   redirect_to context_url(context), notice: "The interaction has been successfully created."
    # end

    # @asset = Asset.new(asset_params)

    if @asset.save
      respond_to do |format|
        format.html { redirect_to admin_root_path, notice: 'OK' }
        format.json { head :no_content }
      end
    end
  end

  private

  def asset_params
    params.require(:asset).permit!
    # params.require(:asset).permit(
    # 	:asset,
    # 	:title
    # 	)
  end

  def context
    if params[:product_id]
      id = params[:product_id]
      Person.find(params[:product_id])
    else
      return nil
    end
  end

  def context_url(context)
    if Product === context
      admin_product_path(context)
    else
      return nil
    end
  end

end




