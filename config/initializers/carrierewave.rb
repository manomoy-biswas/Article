CarrierWave.configure do |config|
  if Rails.env.production?
    config.aws_bucket = ENV['AWS_BUCKET']
    config.aws_acl    = :private
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
    config.aws_attributes = -> { {
      expires: 1.week.from_now.httpdate,
      cache_control: 'max-age=604800'
    } }
    config.aws_credentials = {
      access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_KEY_ID'],
      region:            ENV['AWS_REGION']
    }
  end
end