class FacebookSettings < Settingslogic
  source "#{Rails.root}/config/facebook.yml"
  namespace Rails.env
end