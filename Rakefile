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

   		# Base settings
		if !MySettings['base.site_name']
			MySettings['base.site_name'] = "Rails CMS"
		end
		if !MySettings['base.email']
			MySettings['base.email'] = "example@site.ru"
		end
		if !MySettings['base.tel']
			MySettings['base.tel'] = "+7 (123) 456-78-90"
		end
		if !MySettings['base.second_tel']
	    	MySettings['base.second_tel'] = "+7 (123) 456-78-90"
		end
		if !MySettings['base.address']
   			MySettings['base.address'] = 'Москва, город Зеленоград 123456'
   		end
   		if !MySettings['base.work_time']
   			MySettings['base.work_time'] = 'Ежедневно с 8:00 до 20:00'
   		end
   		if !MySettings['base.info']
   			MySettings['base.info'] = 'Интернет магазин'
   		end

	end
end
