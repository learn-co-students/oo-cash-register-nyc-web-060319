class CashRegister

    attr_accessor :discount, :total

    def initialize(total, discount)
        @total = total
        @discount = discount
        @items = []
    end

    def total
        total = 0
        if discount
            total = total - total * discount / 100.00
        end
        total
    end

    def add_item(item, price, quantity=1)
        quantity.times do
            self.items << item
        end
        self.total += price * quantity
    end

    def apply_discount
        if !discount
            return "There is no discount to apply."
        elsif
            self.total = total - total * discount / 100.00.to_f
            "After the discount, the total comes to $#{total.to_i}."
        end
    end

    def items
        items_list = []
        shopping_cart.each do |item|
            items_list << item.
    end
end # end class CashRegister