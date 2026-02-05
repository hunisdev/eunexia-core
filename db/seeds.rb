# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Integration.find_or_create_by!(source_system: 'medusa') do |integration|
  integration.name = 'Medusa (dev)'
  integration.enabled = true
  integration.settings = {
    base_url: ENV.fetch('MEDUSA_BASE_URL', 'http://localhost:9000'),
    api_key: ENV['MEDUSA_API_KEY']
  }
end