class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        quantity.times do
            items << title
        end
        self.total += price * quantity
        self.last_transaction = price * quantity
    end

    def apply_discount
        if discount == 0
            return "There is no discount to apply."
        elsif
            # self.total = (total * ((100.0 - discount.to_f)/100)).to_f
            discount_rate = discount/100.to_f
            self.total = total * (1 - discount_rate)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
end # end class CashRegister