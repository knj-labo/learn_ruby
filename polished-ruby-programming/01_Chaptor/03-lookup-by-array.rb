
# `100.times.flat_map` iterates 100 times (from 0 to 99) and returns a new array with the concatenated results of the inner block.
# `10.times.map` iterates 10 times (from 0 to 9) and creates an array of arrays, each containing album, track, and artist information.
album_infos = 100.times.flat_map do |i|
  10.times.map do |j|
    ["Album #{i}", j, "Artist #{j}"]
  end
end

# album_infos.flat_map(&:last) iterates through album_infos and extracts the last element (the artist) from each inner array. The flat_map method returns a new array containing all the artist names.
# album_artists.uniq! removes duplicate artist names in-place within the album_artists array.
album_artists = album_infos.flat_map(&:last)
puts album_artists.uniq!