class Stack
	def initialize(stack)

		@stack = []
	end

	def add(el)
		# adds an element to the stack
		@stack << el
		el
	end

	def remove
		# removes one element from the stack
		@stack.pop
	end

	def show
		# return a copy of the stack
		@stack.dup
	end
end

class Queue
	def initialize(queue)
		@queue = []
	end

	def enqueue(el)
		@queue << el
		el
	end

	def dequeue
		@queue.shift
	end

	def show
		@queue.dup
	end
end

class Map
	def initialize
		@map = []
	end

	def assign(key, value)
		key_index = nil
		@map.each_with_index do |arr, i|
			if arr[0] == key
				key_index == i
			end
		end
		if key_index == nil
			@map.push([key,value])
		else
			@map[key_index][1] == value
		end
		[key,value]
	end

	def lookup(key)
		@map.each do pair
			if pair[0] == key
				return pair[1]
			end 
		end
		nil
	end

	def show
		deep_dup(@map)
	end

	private
	def deep_dep(arr)
		arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
	end
end

