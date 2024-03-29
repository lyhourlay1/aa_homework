class LRUCache
    def initialize(num)
        @cache=[]
        @capacity=num
    end

    def count
        # returns number of elements currently in cache
        @cache.length
    end

    def add(el)
        # adds element to cache according to LRU principle
        if !@cache.include?(el)
            if count<@capacity
                @cache<<el
            else
                remove 
                add(el)
            end
        else
            @cache.delete(el)
            add(el)
        end
    end

    def show
        # shows the items in the cache, with the LRU item first
        print @cache 
    end

private
# helper methods go here!
    def remove 
        @cache.shift
    end

end



johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

# space limited and time limted with calling delete having O(n) and add O(n)
# we can improve using linked list and hash together to have O(1) for search add and delete