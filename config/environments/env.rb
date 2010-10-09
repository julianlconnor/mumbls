config.action_mailer.delivery_method = :sendmail
# Defaults to:
# config.action_mailer.sendmail_settings = {
#   :location => '/usr/sbin/sendmail',
#   :arguments => '-i -t'
# }
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true

# config.action_mailer.delivery_method = :smtp
# config.action_mailer.smtp_settings = {
#   :address              => "smtp.mumbls.com",
#   :port                 => 25,
#   :domain               => 'mumbls.com',
#   :user_name            => 'noreply',
#   :password             => 'bewbypewp',
#   :authentication       => 'plain',
#   :enable_starttls_auto => true  }

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
 :address => 'smtp.gmail.com',
 :port => 587,
 :domain => 'mumbls.com',
 :user_name => 'mumbls.noreply',
 :password => 'bewbypewp',
 :authentication => :login,
}
# config.action_mailer.smtp_settings = {
#   :address => "mail.mumbls.com",
#   :port => 25,
#   :domain => 'mumbls.com',
#   :user_name => 'noreply@mumbls.com',
#   :password => 'bewbypewp',
#   :authentication => 'plain',
#   :enable_starttls_auto => true
# }