require "pry"

class CashRegister
    attr_accessor :total
    attr_reader :discount

    def initialize(discount = 100.to_f)
        @total = 0 
        @discount = discount
        @items = []
    end

    def add_item(name, price, quantity = 1)
        @items << {name => {:price => price, :quantity => quantity}}
        @total += (price * quantity)
    end
    
    def apply_discount
        if discount == 100
            return "There is no discount to apply."
        end
        discount_rate = (1- (@discount/(100.to_f)) )
        @total = (@total * discount_rate)
        #binding.pry
        if @total == @total.round
            return "After the discount, the total comes to $#{@total.round}."
        else
            return "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        #binding.pry
        return_items = []
        @items.each do |item|
            #binding.pry
            item[item.keys[0]][:quantity].times do
                return_items << item.keys[0]
            end
        end
        return_items
    end

    def void_last_transaction
        last = @items.pop
        @total -= (last[last.keys[0]][:price] * last[last.keys[0]][:quantity])
    end
end