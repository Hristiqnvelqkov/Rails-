# # config.action_mailer.raise_delivery_errors = true

# #   ActionMailer::Base.smtp_settings = {
# #    :address => "smtp.gmail.com",
# #    :port => 587,
# #    :domain => 'gmail.com',
# #    :authentication => :plain,
# #    :user_name=>hriso1997@gmail.com,
# #    :password=>crossendurolinkin,
# #    :enable_starttls_auto => true
# # }
  # if Rails.env != 'test'
  #   email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/email.yml"))
  #   ActionMailer::Base.smtp_settings = email_settings[Rails.env] unless email_settings[Rails.env].nil?
  # end
# # ActionMailer::Base.smtp_settings = {
# #   :address => "smtp.gmail.com",
# #   :port  => 587,
# #   :domain  => 'localhost',
# #   :user_name => "hriso1997@gmail.com",
# #   :password => "crossendurolinkin",
# #   :authentication => 'plain',
# #   :enable_starttls_auto => true
# # }

# # ActionMailer::Base.default_url_options[:host] = "localhost"