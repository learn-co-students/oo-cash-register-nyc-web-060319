# Started  : 1055 pm

require 'pry'

class CashRegister
	attr_accessor :total, :discount, :quantity

	@@all = []

	def initialize(discount = 0, total_in = 0) #discount optional
		@total = total_in
		@discount = discount
		@quantity = 1
		@prev_total = 0 
		@discount_flag = false
	end


	def self.all
		@@all 
	end


	def self.clear_cart
		self.all.clear
		@discount_flag = false
	end
							#  wrong number of arguments (given 0, expected 2..3)
	def total #, quantity=1)	# quantity optional
		CashRegister.clear_cart
		@total
	end


								#title & price, qty optional
	def add_item(title, price, quantity =1)	#increases the total
		counter = quantity

		while counter > 0
			@@all << title
			counter -= 1
		end

		
		@prev_total = @total
		
		@total = (@prev_total + (price * quantity))


		@total 			
	end




	def apply_discount
		discounted_total = ""
		discount_percent = @discount.to_f/100
		if ((@discount != 0) && (@discount_flag == false))
			discounted_total = (@total - (@total * discount_percent) )
			@total = discounted_total.to_i 					# @total reflect discount,good!
			@discount_flag = true
			return "After the discount, the total comes to $#{@total}."
		else
			return "There is no discount to apply."
		end 

	end


	def items
		@@all

	end

	def void_last_transaction
		@total = @prev_total
	end




end

