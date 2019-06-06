class CashRegister

attr_accessor :discount, :total, :items, :lastPurchase

def initialize(discount=nil)
  @total = 0
  @discount = discount
  @items = []
  @lastPurchase = nil
end

def add_item(title, price, quantity=1)
  @total += price * quantity
  quantity.times do
    @items << title
  end
  @lastPurchase = price * quantity
end

def apply_discount
  if @discount != nil
    @total -= @total * (Float(@discount)/Float(100))
    return"After the discount, the total comes to $" + (@total).to_i.to_s + "."
  else
    return "There is no discount to apply."
  end
end

def void_last_transaction
  @total -= @lastPurchase
end
















end
