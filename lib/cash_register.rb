require 'pry'
class CashRegister
    attr_accessor :total, :discount, :last_transaction_amount, :items
    def initialize(discount = 0)
         @total = 0
         @discount = discount
         @items = []
    end

    def add_item(title, price, quantity =  1)
        @total += price * quantity
        quantity.times do
            items << title
        end

        self.last_transaction_amount = price * quantity
    
    
    end

    def apply_discount()
        if @discount > 0
            self.total = (total * (1- (discount/100.0))).to_i
            return "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction_amount
    
    end 

end
