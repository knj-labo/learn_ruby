# @see https://rubydoc.info/stdlib/core/Enumerable#flat_map-instance_method
album_infos = 100.times.flat_map do |i|
  10.times.map do |j|
    puts ["Album #{i}", j, "Artist #{j}"]
  end
end
