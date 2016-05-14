class Admin::SettingsController < Admin::BaseController
  def index
    @settings = Settings.get_all
    @base_settings = Settings.get_all('base.')
    @seo_settings = Settings.get_all('seo.')
    @mail_settings = Settings.get_all('mail.')
  end
  def update


    settings_params.each do |setting, value|
      Settings.where(var: setting).first.update_attribute :value, value
    end

    @settings = Settings.get_all

    render json: @settings
  end

  private

  def settings_params
    params.require(:settings).permit(
      :'seo.title',
      :'seo.description',
      :'mail.host',
      :'mail.from',
      :'mail.address',
      :'mail.port',
      :'mail.user_name',
      :'mail.password',
      :'base.site_name',
      :'base.email',
      :'base.tel',
      :'base.second_tel',
      :'base.address',
      :'base.work_time',
      :'base.info',
      :'addtl.scripts'
    )
  end
end
