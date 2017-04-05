require 'carrierwave/orm/activerecord'


CarrierWave.configure do |config|
  # Make the tmp dir work on Heroku
  config.cache_dir = "#{Rails.root}/tmp/uploads"

  if Rails.env.production? || Rails.env.development?
    config.fog_credentials = {
      provider:               "AWS",
      # When precompiling assets Fog will be initialized and needs to be
      # initialized (even though it will never touch S3), provide some values
      # to prevent Fog gem from crashing during initialize wihtout actually
      # giving away the keys.
      # aws_access_key_id:      ENV["S3_KEY"] || "S3_KEY",
      # aws_secret_access_key:  ENV["S3_SECRET"] || "S3_SECRET"
      aws_access_key_id:      ENV["S3_KEY"] || "S3_KEY",
      aws_secret_access_key:  ENV["S3_SECRET"] || "S3_SECRET"
    }
    config.storage 'fog/aws'

    config.fog_directory  = ENV["S3_BUCKET"]
    # App requires explicit protocol to be specified for uploaded assets
    # Do not change to "//..." like we are doing with the other asset hosts
    config.asset_host     = "https://#{ENV["S3_CDN_HOST"]}"

    config.fog_public = false
    config.fog_authenticated_url_expiration = 1.week.to_i

    # Server side encryption.
    config.fog_attributes = {
      'x-amz-server-side-encryption' => 'AES256',
      'Cache-Control' => 'max-age=315576000',
      'Expires' => 1.week.from_now.httpdate
    }

  # elsif Rails.env.development?
    # config.storage :file
    # config.asset_host = "http://#{ENV["S3_CDN_HOST"] || ENV["HOST"]}"

  elsif Rails.env.test?
    config.storage NullStorage
    # Required to prevent FactoryGirl from giving an infuriating exception
    # ArgumentError: wrong exec option
    # It also speeds up tests so it's a good idea
    config.enable_processing = false
  end
end
