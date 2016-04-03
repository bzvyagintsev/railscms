class Admin::MySettingsController < Admin::BaseController
	def index
		@settings = MySettings.unscoped
		@seo_settings = MySettings.get_all('seo.')
		@mail_settings = MySettings.get_all('mail.')
	end
	def update
		settings_params.each do |setting, value|
			MySettings.where(var: setting).first.update_attribute :value, value
		end
		
		redirect_to admin_settings_path, :flash => { success: "Настройки сохранены"}  # Redirect to the settings index
	end

	private

	def settings_params
		params.require(:settings).permit(:'seo.title', :'seo.description', :'mail.host', :'mail.from', :'mail.address', :'mail.port', :'mail.user_name', :'mail.password')
	end
end