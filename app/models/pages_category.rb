class PagesCategory < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :title, use: [:slugged, :finders]
  	
	acts_as_nested_set
	
	has_many :pages, dependent: :destroy
	validates :title, uniqueness: { case_sensitive: false }

	def normalize_friendly_id(text)
  		text.to_s.to_slug.normalize(transliterations: :russian).to_s
	end
	
	def should_generate_new_friendly_id?
    	slug.nil? || title_changed?
  	end
end
