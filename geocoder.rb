require 'geocoder'

# Geocoder.coordinates 'location name'
print 'Where are you want to know?'
input = gets.chomp
loCord = Geocoder.coordinates (input)
p loCord
