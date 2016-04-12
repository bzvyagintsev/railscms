class Product < ActiveRecord::Base
	extend FriendlyId 
  	friendly_id :title, use: [:slugged, :finders]	

	belongs_to :products_category
	has_many :line_items

 	mount_uploader :cover, ProductCoverUploader

	scope :active, -> { where(active: true) }

	scope :not_active, -> { where(active: false) }

	def normalize_friendly_id(text)
  		text.to_s.to_slug.normalize(transliterations: :russian).to_s
	end
	
	def should_generate_new_friendly_id?
    	slug.nil? || title_changed?
  	end



end
