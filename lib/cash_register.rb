class CashRegister
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_trans = {}
    end

    attr_accessor :total
    attr_reader :discount, :items

    def add_item(title, price, quantity=1)
        @total += price * quantity
        quantity.times do
            items << title
        end
        @last_trans = [price, quantity]
    end

    def apply_discount()
        if discount != 0
            @total -= @total * @discount / 100.00
            return "After the discount, the total comes to $#{total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @items = @items.slice(@items.size - @last_trans[1])
        @total -= @last_trans[0]
    end
end