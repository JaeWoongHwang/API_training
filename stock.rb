require 'stock_quote'

DATA.each do |company|
  company.chomp!
  stock = StockQuote::Stock.quote(company)
  puts stock.name
  puts stock.l
end

# __END__ 밑은 루비 코드로 인식하지 않음. 밑에 쓴 데이터 들은 DATA에 자동으로 저장 돼있음.
__END__
APPL
FB
TSLA
GOOGL
AMZN
