# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

# !rake rails_cms:default_settings
# MySettings.destroy('seo.seo_title') - чтобы удалить

namespace :rails_cms do
	desc "Default settings for website"
	task default_settings: :environment do

		# SEO settings
		if !MySettings['seo.title']
			MySettings['seo.title'] = "Default SEO title"
		end

		if !MySettings['seo.description']
			MySettings['seo.description'] = "Default SEO description"
		end

		# Yandex mail settings
		if !MySettings['mail.host']
			MySettings['mail.host'] = "site.ru"
		end
		if !MySettings['mail.from']
			MySettings['mail.from'] = "info@site.ru"
		end
		if !MySettings['mail.address']
			MySettings['mail.address'] = "smtp.yandex.ru"
		end
		if !MySettings['mail.port']
	    	MySettings['mail.port'] = 587
		end
		if !MySettings['mail.user_name']
   			MySettings['mail.user_name'] = 'user_name'
   		end
   		if !MySettings['mail.password']
   			MySettings['mail.password'] = '12345678'
   		end

	end
end
