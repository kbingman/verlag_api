require 'carrierwave/mongoid'


class ImageUploader < CarrierWave::Uploader::Base
  storage :grid_fs

  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}"
  end
  
  def content_type
    self.file.content_type
  end
  
  def filename
    File.basename(self.url) if self.url
  end
  
end