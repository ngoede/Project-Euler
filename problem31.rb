class Money
	
	attr :amount, :type

	def initialize(amount, type)
		@amount = amount
		@type = type
	end
	
	def to_s
		if type == :pence then
			amount += "p"
		elsif type == :pound then
			amount += "f"
		else
			raise "Invalid type"
		end
	end
	
	def -(other)
		raise "Invalid Subtraction" if self.type == :pence and self.amount < other.amount
		raise "Invalid Subtraction" if self.type == :pence and self.amount < 100 and other.type == :pound and other.amount != 0
		thisAmount = self.type == :pound ? self.amount * 100 : self.amount
		otherAmount = other.type == :pound ? other.amount * 100 : other.amount
	end
end

