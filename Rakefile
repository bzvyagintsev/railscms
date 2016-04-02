# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

# !rake rails_cms:default_settings
namespace :rails_cms do
	desc "Default settings for website"
	task default_settings: :environment do
		MySettings.create! var: 'seo_title', value: 'Default storefront seo title'
		MySettings.create! var: 'seo_description', value: 'Default storefront seo description'

	end
end
