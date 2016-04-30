class ApplicationController < ActionController::Base
  
  include CurrentCart
  
  before_action :set_cart
  before_action :set_products_categories

  before_action :prepare_meta_tags, if: "request.get?"

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :set_csrf_cookie_for_ng

  private

  def prepare_meta_tags(options={})
    site_name   = "Rails CMS"
    title       = Settings['seo.title']
    description = Settings['seo.description']
    image       = options[:image] || "your-default-image-url"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      # site:        site_name,
      title:       title,
      image:       image,
      description: description,
     }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end

  def set_products_categories
   @products_categories = ProductsCategory.friendly.roots
  end

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  protected

  # In Rails 4.2 and above
  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

end
