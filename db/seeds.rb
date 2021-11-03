# Add seed data here. Seed your database with `rake db:seed`

artist_list = {
    "Billy The Kid" => {
    },
    "Mark Zuckerberg" => {
    },
    "Ada Lovelace" => {
    },
    "Linus Torvalds" => { 
    }
  }

artist_list.each do |name, artist_hash|
  p = Artist.new
  p.name = name
  p.save
end

genre_list = {
    "Rock" => {
    },
    "Rap" => {
    },
    "Pop" => {
    },
    "EDM" => {
    }
  }

genre_list.each do |name, genre_hash|
  p = Genre.new
  p.name = name
  p.save
end

songs_list = {
    "Madison Square Guarden" => {
      :artist_id => 1
    },
    "The big bull outside" => {
      :artist_id => 1
    },
    "Flatiron School" => {
      :artist_id => 2
    },
    "Museum Mile" => {
      :artist_id => 3
    },
    "Subway Station" => {
      :artist_id => 4
    }
  }

songs_list.each do |name, song_hash|
  p = Song.new
  p.name = name
  song_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

