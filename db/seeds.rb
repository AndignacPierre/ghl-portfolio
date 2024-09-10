require 'open-uri'

puts "Cleaning database..."
Photo.destroy_all
Album.destroy_all

puts "Creating photos"

photo = Photo.create(
  title: "Photo 1",
  description: "de très jolis tchoutchs",
  image: "https://res.cloudinary.com/your_cloud_name/image/upload/v1234567890/13_jxws7b.jpg"
)

puts "Created #{photo.title}"
