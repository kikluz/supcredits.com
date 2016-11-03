if Rails.env == 'production'

  # for heroku using environment config variables
  SQUAREUP_CONFIG = {
    auth: ENV['AUTH']
  }.symbolize_keys

else

  # path to yaml file
  file_path = Rails.root.join('config/secrets/squareup.yml')

  # load yaml into hash
  hash = YAML.load_file(file_path)

  # grab hash for this environment
  SQUAREUP_CONFIG = hash[Rails.env].symbolize_keys
end
