class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def content_type_whitelist
    /image\//
  end


  # Process files as they are uploaded:
  process resize_to_fit: [1000, 600]
  #
   def scale(width, height)
     # do something
   end

  # Create different versions of your uploaded files:
   version :thumb do
     process resize_to_fit: [400, 200]
   end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_whitelist
     %w(jpg jpeg gif png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
