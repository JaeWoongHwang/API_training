require 'forecast_io'

# my skydark API key = '50c2ea6574796bd3bc3b22517db7fac5'

ForecastIO.configure do |configuration|
  configuration.api_key = '50c2ea6574796bd3bc3b22517db7fac5'
end

forecast = ForecastIO.forecast(37.8267, -122.423)

f = forecast.currently

def f_to_c(f)
  f = f.to_f
  ((f-32) * 5 / 9).round(2)
end

puts f.summary
puts "#{f_to_c f.temperature} degrees"
