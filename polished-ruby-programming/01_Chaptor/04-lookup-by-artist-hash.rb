album_infos = 100.times.flat_map do |i|
  10.times.map do |j|
    ["Album #{i}", j, "Artist #{j}"]
  end
end

album_artists = {}
album_infos.each do |_, _, artist|
  album_artists[artist] ||= true
end

# `lookup = ->(artists) do` defines a lambda function called lookup with one parameter: artists, which should be an array of artist names.
lookup = ->(artists) do
  artists.select do |artist|
    album_artists[artist]
  end
end

# the lookup lambda function can be used to filter an array of artist names,
# keeping only the ones that are present in the album_artists hash.
# For example:
# ```
# some_artists = ["Artist 1", "Artist 5", "Unknown Artist"]
# filtered_artists = lookup.call(some_artists)
# ```