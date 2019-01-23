require("pry")
require_relative("../models/Album")
require_relative("../models/Artist")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({"name" => "Aldous Harding"})
artist1.save()

artist2 = Artist.new({"name" => "Miles Davis"})
artist2.save()

album1 = Album.new({"name" => "Horizon", "genre" => "Indie", "artist_id" => artist1.id})
album1.save()

album2 = Album.new({"name" => "Kind of Blue", "genre" => "Jazz", "artist_id" => artist2.id})
album2.save()


binding.pry
nil
