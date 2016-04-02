class ApplicationController < ActionController::Base

  before_action :prepare_meta_tags, if: "request.get?"

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def prepare_meta_tags(options={})
    site_name   = "Rails CMS"
    title       = MySettings.seo_title
    description = MySettings.seo_description
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

end
