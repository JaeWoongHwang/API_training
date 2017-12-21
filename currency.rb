require 'eu_central_bank'

@bank = EuCentralBank.new

def exchange(from)
  @bank.update_rates
  @bank.exchange(100, from, 'KRW')
end

puts "$1는 #{exchange('USD')}원"
