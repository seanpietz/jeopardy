
module Fun
	def self.imap(list, &func)
		i = 0
		ret = []
		for x in list
			ret.push(func.call(i, x))
			i += 1
		end
		ret
	end

	def self.mmap(list, &func)
		mem = nil
		ret = []
		for x in list
			ret.push(func.call(mem, x))
			mem = x
		end
		ret
	end
end