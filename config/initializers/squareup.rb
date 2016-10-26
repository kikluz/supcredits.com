# path to yaml file
file_path = Rails.root.join('config/secrets/squareup.yml')

# load yaml into hash
hash = YAML.load_file(file_path)

# grab hash for this environment
SQUAREUP_CONFIG = hash[Rails.env]
