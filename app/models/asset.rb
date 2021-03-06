class Asset < ActiveRecord::Base
  belongs_to :assetable, polymorphic: true

  mount_uploader :asset, AssetUploader
end
