album_info = 100.times.flat_map do |i|
  10.times.map do |j|
    ["Album #{i}", j, "Artist #{j}"]
  end
end

# album_info.flat_map(&:last) iterates through album_info
# and extracts the last element (the artist) from each inner array.
# The flat_map method returns a new array containing all the artist names.
# `Set.new(album_info.flat_map(&:last))` creates a new Set from the array of artist names, which automatically removes duplicates.
# This new Set is assigned to the variable album_artists.
album_artists = Set.new(album_info.flat_map(&:last))

lookup = ->(artists) do
  album_artists & artists
end