class Admin::MySettingsController < Admin::BaseController
	def index
		@settings = MySettings.unscoped
	end
	def update
		settings_params.each do |setting, value|
			MySettings.where(var: setting).first.update_attribute :value, value
		end
		
		redirect_to admin_settings_path, :flash => { success: "Настройки сохранены"}  # Redirect to the settings index
	end

	private

	def settings_params
		params.require(:settings).permit(:seo_title)
	end
end