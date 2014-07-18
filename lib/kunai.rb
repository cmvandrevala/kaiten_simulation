require 'matrix'

class Kunai

	attr_reader :area, :mass
	attr_accessor :position, :velocity 

	def initialize
		@area = 0.01
		@mass = 1.0
		@position = Vector[20, 0, 0]
		@velocity = Vector[-25, 0, 0]
	end

end