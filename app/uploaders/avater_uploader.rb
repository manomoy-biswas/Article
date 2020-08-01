class AvaterUploader < CarrierWave::Uploader::Base

  # Choose what kind of storage to use for this uploader:
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :aws
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
 
   # Add a white list of extensions which are allowed to be uploaded.
   def extension_whitelist
     %w(jpg jpeg png)
   end
 
   # Override the filename of the uploaded files:
   def filename
     @name ||= "Profile_picture_#{DateTime.now.strftime("%d%m%Y")}.jpg" if original_filename
   end
end
