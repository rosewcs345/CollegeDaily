
  OmniAuth.config.logger = Rails.logger

#************************************************
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer if Rails.env.development?
  	provider :github, '7c85e6dd6dea926ca21d','294412e58831b13ea91142212063cb4cae840ac2',
  	{ :name => "github",
      :scope => ['read:user','user:email']}
  	#provider :nnn, 'api_key', 'api_secret'
  	#provider :twitter, 
  	#provider :facebook, 
  	#provider :google_oauth2, 	
    #provider :linkedin, 
  end
        