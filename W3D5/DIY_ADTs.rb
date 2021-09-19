class Stack
    

    def initialize
      # create ivar to store stack here!
      @ivar=[]
    end

    def push(el)
      # adds an element to the stack
      ivar.push(el)
      el
    end

    def pop
      # removes one element from the stack
      ivar.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      ivar.last
    end

    private
    attr_reader :ivar
end

  class MyQueue
    
    def initialize
      @ivar=[]
    end

    def enqueue(el)
      ivar.unshift(el)
      #show the stack bc its part of the implementation
      self
    end

    def dequeue
      ivar.pop
    end

    def size
      ivar.size
    end

    def empty?
      ivar.empty?
    end

    def show
      #to hide the return array
      print store 
    end

    def peek
      ivar.last
    end
    #outside class cannot call 
    private
    attr_reader :ivar
  end

  class Map
    def initialize
        @arr =[[]]
    end

    def set (key,value)
        @arr<< [key,value]
    end

    def get(key)
        i=0
        return [key,value] if @arr[0][i]==key
        return nil if key ==nil
        get(@arr[0][i+1])
    end

    def delete(key)
        @arr.delete(key)
    end

    def show
        @arr
    end
  end