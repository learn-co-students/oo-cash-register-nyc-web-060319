class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
     quantity.times do self.items <<  item
  end
    self.last_transaction = price * quantity
end


def apply_discount
  if discount > 0
    @total = total - total * discount / 100
    "After the discount, the total comes to $#{@total}."
  elsif
    @total
    "There is no discount to apply."
  end
end

def void_last_transaction
  self.total -= self.last_transaction
end



# def items(items)
#   @items << add_item
# end



end # end of classes
