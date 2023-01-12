class PassengerTrain < Train
	def initialize(number, type)
		super(number,type)
		@type == 'Passanger'
	end
end
