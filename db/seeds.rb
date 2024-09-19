require 'open-uri'

puts 'Cleaning database...'
Photo.destroy_all
Album.destroy_all

puts 'Creating photos'

# Define a helper method to create a photo with a Cloudinary-hosted image
def create_photo(title, description, category, cloudinary_key)
  photo = Photo.new(
    title: title,
    description: description,
    category: category
  )

  # First, save the photo without the image
  if photo.save
    puts "Created #{photo.title}."

    # Define the Cloudinary base URL
    cloudinary_base_url = 'https://res.cloudinary.com/ddwepm3lq/image/upload'

    # Use the Cloudinary key to attach the image
    begin
      image_url = "#{cloudinary_base_url}/#{cloudinary_key}.jpg"
      puts "Attempting to attach image from URL: #{image_url}"

      # Attach the image
      photo.image.attach(
        io: URI.open(image_url),
        filename: "#{cloudinary_key}.jpg",
        content_type: 'image/jpg'
      )

      if photo.image.attached?
        puts "#{photo.title} image attached successfully."
      else
        puts "Image not attached for #{photo.title}. Deleting the photo."
        photo.errors.full_messages
        photo.destroy
      end

    rescue OpenURI::HTTPError => e
      puts "Failed to attach image for #{photo.title} from #{image_url}: #{e.message}"
      photo.destroy # Optionally remove the photo if image attachment fails
    end
  else
    puts "Failed to create photo #{title}."
  end
end

# Seed data with Cloudinary keys
create_photo('Photo 1', 'Mettre une description ici', 'pro', 'image_1_jzttep')
create_photo('Photo 2', 'Mettre une description ici', 'pro', 'image_2_nsjuyy')
create_photo('Photo 3', 'Mettre une description ici', 'pro', 'image_3_wtjqg3')

puts 'Photos created successfully!'
