class LottoController < ApplicationController
    
    def index
        
    end
    
    def pick_and_check

require("open-uri")
require("json")

lotto_hash = JSON.parse(open("http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=748").read)

# 내 번호 
my_numbers = [*1..45].sample(6).sort!

# 이번주 추첨번호 + 보너스 번호 
drw_numbers = [lotto_hash["drwtNo3"], lotto_hash["drwtNo2"], lotto_hash["drwtNo1"], lotto_hash["drwtNo6"], lotto_hash["drwtNo4"], lotto_hash["drwtNo5"]].sort!
bonus_number = lotto_hash["bnusNo"]

## 이번주 추첨번호를 가져오는 다른 방법
##
## lotto_hash.each do |k, v|
##     if(k.include?('drwtNo'))
##         drw_numbers << v
##     end
## end
##
## drw_numbers.sort!

# 겹치는 번호
match_numbers = my_numbers & drw_numbers

# 등수를 담을 변수 (추가)
my_rank = String.new

if match_numbers.length == 6
    my_rank = "1등"
elsif match_numbers.length == 5 && bonus_number
    my_rank = "2등"
elsif match_numbers.length == 5
    my_rank = "3등"
elsif match_numbers.length == 4
    my_rank = "4등"
elsif match_numbers.length == 3
    my_rank = "5등"
else
    my_rank = "꽝"
end

@my_numbers = my_numbers
@drw_numbers = drw_numbers
@bonus_number = bonus_number
@match_numbers = match_numbers
@my_rank = my_rank


    end

end
