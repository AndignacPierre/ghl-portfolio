# config/initializers/cloudinary.rb

Cloudinary.config do |config|
  config.cloudinary_url = ENV['CLOUDINARY_URL']
end