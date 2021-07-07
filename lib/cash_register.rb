require "pry"
class CashRegister

    attr_accessor :discount, :price
    attr_reader :total

    

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @price = price
        @lastitemamount = 0
        @lastprice = 0
        return @total
    end

    def total=(total)
        @total = total
    end

    def add_item(title, price, amount = 1)
        #binding.pry
        @total += (price * amount)
        amount.times do
            @items << title
        end
        @lastitemamount = amount
        @lastprice = price
    end
    
    def apply_discount()
        
        @total *= (1-(discount.to_f/100).to_f)
        #binding.pry
        if discount == 0
            return "There is no discount to apply."
        else
            return "After the discount, the total comes to $#{@total.to_i}."
        end
        
    end

    def items()
       return @items
    end

    #total - last transaction 
    def void_last_transaction
        @total -= (@lastitemamount * @lastprice.to_f)
        #binding.pry
    end

end

CashRegister.new()