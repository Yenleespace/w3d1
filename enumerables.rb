require "byebug"

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1  
        end
        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each(&prc).each do |ele|
            new_arr << ele if prc.call(ele)
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        i = 0
        while i < self.length
            new_arr << self[i] if !prc.call(self[i])
            i += 1
        end
        new_arr
    end

    def my_any?(&blk)
        i = 0
        while i < self.length
            return true if blk.call(self[i])
            i += 1
        end
        false
    end

    def my_all?(&blk)
        i = 0
        while i < self.length
            return false if !blk.call(self[i])
            i += 1
        end
        true
    end

    def my_flatten
        return self if !self.is_a?(Array)
        result = []
        self.each do |ele|
            if !ele.is_a?(Array)
                result << ele
            else
                result += ele.my_flatten
            end
        end
        result
    end
end

    #     # debugger
    #     return [self] if !self.is_a?(Array) 
    #     return self if self.empty?
    #     self[0].my_flatten + self[1..-1].my_flatten
        
        
    # end

    # def flatten(data)
    #     return [data] unless data.is_a? Array
    #     return data if data.empty?
    #     flatten(data[0]) + flatten(data[1..-1])
    # end

#     def flatten(data)
#         return [data] if !data.is_a?(Array)
#         result = []
#         data.each do |el|
#           if el.is_a?(Array)
#             result += flatten(el)
#           else
#             result << el
#           end
#         end
#         result
#     end
# end
# p ['20'].my_flatten


# a = [1, 2, 3]
# a.my_select { |num| num > 1 } # => [2, 3]
# a.my_select { |num| num == 4 } # => []

# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end
#    # => 1
#        2
#        3
#        1
#        2
#        3
   
#    p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
