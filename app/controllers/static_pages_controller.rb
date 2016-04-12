class StaticPagesController < ApplicationController
	def home
    # prepare_meta_tags title: 'Декоративные панели для стен, купить гипсовые стеновые панели', description: 'Декоративные панели для стен - Deco Line, негорючие и экологичные декоративные панели, купить гипсовые стеновые панели с доставкой по всей России, интернет магазин декоративных панелей'
  	@products = Product.all.paginate(:per_page => 2, :page => params[:page])
  end
 
  def about    
    # prepare_meta_tags title: 'Deco Line | О компании - производитель 3д гипсовых панелей', description: 'Deco Line | О компании, производитель 3д гипсовых панелей'
  end

  def cart
  end

  def contacts
  end
  
end
