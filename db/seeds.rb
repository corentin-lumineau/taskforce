puts "Creating users..."
User1 = { email: "corentin@gmail.com", password: "123456", first_name: "Corentin", last_name: "Lumineau" }
User2 = { email: "thomas@gmail.com", password: "123456", first_name: "Thomas", last_name: "CTO" }


users = []


photos = [
"https://fr.web.img2.acsta.net/pictures/19/03/14/11/10/0992674.jpg",
"https://res.cloudinary.com/dax8lsbkx/image/upload/v1599211135/louis_ro7uoa.jpg"
]

[User1, User2].each_with_index do |attributes, index|
    p current_user = User.create!(attributes)
    p file_avatar = URI.open(photos[index])
    p current_user.photo.attach(io: file_avatar, filename: 'image.jpg', content_type: 'image/jpg')
    users << current_user
   end