require 'stock_quote'
require 'eu_central_bank'


# Exchange
@bank = EuCentralBank.new
def usd_to_krw(volume)
  @bank.update_rates
  rate = @bank.exchange(100, 'USD', 'KRW').to_f
  result = volume.to_f * rate
end

# ARGV(argument vector)는 Java의 args와 같음. 입력받은 값을 배열로 만듦
ARGV.each do |company|
  # Get information
  # company.chomp!
  stock = StockQuote::Stock.quote(company)
  puts "#{stock.name} $#{stock.l} / Korean price is (₩#{usd_to_krw(stock.l).round(1)})"
end
