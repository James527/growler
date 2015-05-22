require 'sinatra'
require 'sinatra/reloader'
require 'csv'

class Growl
	attr_accessor :text
	def initialize(text)
		@text = text
	end
end

get '/' do
	arr_of_growls = []
	CSV.foreach('growls.csv') do |row|
		arr_of_growls << row[0]
	end

	# i = 0
	# for index in arr_of_growls do
	# 	p arr_of_growls[i]
	# 	i += 1
	# end

	# growl_array = Growl.new('Testtesttest, another test, and yet another')
	@growls = "#{arr_of_growls.join(', ')}"
	erb :index
end