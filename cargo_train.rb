class CargoTrain < Train
	def initialize(number, type)
		super(number,type)
		@type == 'Cargo'
	end
end
