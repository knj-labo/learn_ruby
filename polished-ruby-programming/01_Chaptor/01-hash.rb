# @see https://rubydoc.info/stdlib/core/Enumerable#flat_map-instance_method
album_infos = 100.times.flat_map do |i|
  10.times.map do |j|
    ["Album #{i}", j, "Artist #{j}"]
  end
end

album_artists = {}
album_track_artists = {}
# `album_infos.each` iterates through the collection album_infos.
# `|album, track, artist|` are the block parameters, and for each iteration,they represent the album, track, and artist respectively.
album_infos.each do |album, track, artist|
  # `(album_artists[album] ||= [])` is an expression that checks if the album key exists in the album_artists hash.
  # If it doesn't exist, it initializes the key with an empty array as its value.
  # `<< artist appends` the artist to the array associated with the album key in the album_artists hash.
  (album_artists[album] ||= []) << artist
  # `(album_track_artists[[album, track]] ||= [])` is an expression that checks if the [album, track] key exists in the album_track_artists hash.
  # If it doesn't exist, it initializes the key with an empty array as its value.
  # `<< artist appends` the artist to the array associated with the [album, track] key in the album_track_artists hash.
  (album_track_artists[[album, track]] ||= []) << artist
end
