Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'T5N5EPTIDwi88gbISxXZaw', 'UyGDw8I6voDLwtw5nRLx73lkjSmjXbNpnimzhM6oFA'
#  provider :facebook, 'APP_ID', 'APP_SECRET'
end
