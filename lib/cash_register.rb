require 'pry'

class CashRegister
    attr_accessor :discount, :total
        def initialize(discount=0)
            @items = []
            @total = 0
            @discount = discount
        end

        def add_item(title, price, quantity=0)
            @quantity = quantity
            if quantity == 0
                @items << title
                @total += price
            else
                @total += price * quantity
                while quantity > 0
                    @items << title
                    quantity -= 1
                end
                    
            end
        end

        def apply_discount
            if @discount > 0
                @discount = @total * (@discount/100.0)
                @total = @total - @discount
                @total = @total.to_i
                return "After the discount, the total comes to $#{total}."
            else
               return "There is no discount to apply." 
            end
        end

        def items
           @items
        end

        def void_last_transaction
            @total = 0 
        end
end
