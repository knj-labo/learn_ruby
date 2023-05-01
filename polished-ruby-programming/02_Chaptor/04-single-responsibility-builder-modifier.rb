builder = TextBuilder.new
builder.append("test")
builder.append("ing...1...2")

# prints the built text, which would be:
# puts builder.to_s
# testing...1...2

builder.append(". Found: ")
builder.append(name)

# The output would be:
# testing...1...2. Found: Amazing_person
puts builder.as_string
