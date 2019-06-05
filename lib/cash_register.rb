class CashRegister
    attr_accessor :total, :discount, :items, :price, :last_transaction

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @price = price
    end

    def add_item(item, price, quantity=1)
        self.total += price * quantity
        quantity.times do 
            self.items << item
        end
        @last_transaction = price * quantity
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            percentage = discount.to_f / 100
            discount_amount = self.total * percentage
            self.total -= discount_amount
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end
