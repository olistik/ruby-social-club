OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  unless Rails.env.production?
    provider :developer, # mimic twitter info
      :fields => [:nickname, :name, :uid],
      :uid_field => :uid
  end
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end
