# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

# rake tmp:cache:clear
# !rake rails_cms:default_settings
# Settings.destroy('seo.seo_title') - чтобы удалить

namespace :rails_cms do
	desc "Default settings for website"
	task default_settings: :environment do

		# SEO settings
		if !Settings['seo.title']
			Settings['seo.title'] = "Default SEO title"
		end

		if !Settings['seo.description']
			Settings['seo.description'] = "Default SEO description"
		end

		# Yandex mail settings
		if !Settings['mail.host']
			Settings['mail.host'] = "site.ru"
		end
		if !Settings['mail.from']
			Settings['mail.from'] = "info@site.ru"
		end
		if !Settings['mail.address']
			Settings['mail.address'] = "smtp.yandex.ru"
		end
		if !Settings['mail.port']
	    	Settings['mail.port'] = 587
		end
		if !Settings['mail.user_name']
   			Settings['mail.user_name'] = 'user_name'
   		end
   		if !Settings['mail.password']
   			Settings['mail.password'] = '12345678'
   		end

   		# Base settings
		if !Settings['base.site_name']
			Settings['base.site_name'] = "Rails CMS"
		end
		if !Settings['base.email']
			Settings['base.email'] = "example@site.ru"
		end
		if !Settings['base.tel']
			Settings['base.tel'] = "+7 (123) 456-78-90"
		end
		if !Settings['base.second_tel']
	    	Settings['base.second_tel'] = "+7 (123) 456-78-90"
		end
		if !Settings['base.address']
   			Settings['base.address'] = 'Москва, город Зеленоград 123456'
   		end
   		if !Settings['base.work_time']
   			Settings['base.work_time'] = 'Ежедневно с 8:00 до 20:00'
   		end
   		if !Settings['base.info']
   			Settings['base.info'] = 'Интернет магазин'
   		end

   		# Additional
   		if !Settings['addtl.scripts']
   			Settings['addtl.scripts'] = ''
   		end

	end
end
