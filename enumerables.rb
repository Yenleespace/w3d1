require "byebug"

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1  
        end
        return self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.each do |ele|
            new_arr << ele if !prc.call(ele)
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
        new_arr = []
        self.each do |ele|
            if !ele.is_a?(Array)
                new_arr << ele
            else
                new_arr += ele.my_flatten
            end
        end
        new_arr 
    end

    def my_zip(*arrays) ######
        new_arr = []
        self.length.times do |i|
            sub_arr = [self[i]]

            arrays.each do |array|
                sub_arr << array[i]
            end
            new_arr << sub_arr
        end
        new_arr
    end

    def my_rotate(num = 1)
        new_arr = []
        self.each_with_index do |ele, i|
            new_idx = (num + i) % self.length
            new_arr << self[new_idx]
        end
        new_arr
    end

    def my_join(separator = "")
        join_str = ""
        self.each_with_index do |ele, i|
            join_str += ele 
            join_str += separator if i != self.length - 1
        end
        join_str
    end

    def my_reverse
        new_arr = []
        i = self.length - 1
        while i >= 0 
            new_arr << self[i]
            i -= 1
        end
        new_arr
    end
    
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

