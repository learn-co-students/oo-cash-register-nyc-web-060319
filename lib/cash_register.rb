require 'pry'
class CashRegister

    attr_accessor :discount, :total
    attr_reader :items

    def initialize(discount=0) #All the crap you need to start off with. 
        @total = 0 #always want total to be zero when making new regsister(person shopping cart=0), so set it to zero upon init
        @discount = discount #discount can either start out as zero if none given, but will turn to number if given (ex. person has coupon)
        @items = [] #start off with an empty cart. Over time, as items added, accumulate item in cart (if more than 1 of same item, add item however many times )
        @prices = []
    end


    def add_item(title, price, quantity=1) #item name, item prive, how many? (if you are adding an item, always will be at least 1)
            quantity.times do #for whatever numerical-value quantity is, add the title that many times to @items
                # @items << {title => price}
                @items << title
                @prices << price
            end
        @total += price * quantity
    end
    
    def apply_discount
        # 1000 - 200(which is 20% of 1000)
        if @discount > 0
            @total = (@total - (@total*(@discount.to_f/100.to_f))).to_i
            "After the discount, the total comes to $#{@total}."
        else 
            "There is no discount to apply."
        end
    end


    def void_last_transaction
        #subtracts last transaction from total
        @total = @total - (@prices[-1])
    end

end

reg1 = CashRegister.new(20)
reg1.add_item("Apple", 5)
reg1.add_item("Orange", 5, 3)
#right here reg1.total = 20, reg1.apply_discount returns 16
binding.pry 