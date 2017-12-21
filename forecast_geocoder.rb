require 'forecast_io'
require 'geocoder'

# Geocoder.coordinates 'location name'
print 'Where are you want to know?'
input = gets.chomp
loCord = Geocoder.coordinates (input)
p "Location : #{loCord}"

# Get weather information
ForecastIO.configure do |configuration|
  configuration.api_key = '50c2ea6574796bd3bc3b22517db7fac5'
end

# forecast = ForecastIO.forecast(loCord[0], loCord[1])
forecast = ForecastIO.forecast(loCord.first, loCord.last)

f = forecast.currently

def f_to_c(f)
  f = f.to_f
  ((f-32) * 5 / 9).round(2)
end

puts "Weather : #{f.summary}"
puts "Celsius : #{f_to_c f.temperature}"
