require 'open-uri'

puts 'Cleaning database...'
Photo.destroy_all
Album.destroy_all

puts 'Creating photos'

photo = Photo.create(
  title: 'Photo 1',
  description: 'mettre une description ici',
  image: 'https://res.cloudinary.com/ddwepm3lq/image/upload/v1234567890/13_jxws7b.jpg',
  category: 'pro'
)

puts "Created #{photo.title}"
