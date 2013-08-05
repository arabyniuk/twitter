class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  def self.from_omniauth(auth)
	  user = where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	  user.oauth_token = auth["credentials"]["token"]
	  user.oauth_secret = auth["credentials"]["secret"]
	  user.save!
	  user
  end

  def self.create_from_omniauth(auth)
  	create! do |user|
  		user.provider = auth["provider"]
  		user.uid = auth["uid"]
  		user.name = auth["info"]["name"]
  	end
  end

  def twitter
  	@twitter = Twitter::Client.new(consumer_key: "dgQmVubATe2FgbkrC5gsPQ",consumer_secret: "UCVhQwfwsqJtKrWTpgMzxXPrxstHhcqJMc5bs4mjs", oauth_token: oauth_token, oauth_token_secret: oauth_secret)

  end
end
