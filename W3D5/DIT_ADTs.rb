class Stack
    def initialize
      # create ivar to store stack here!
      @ivar=[]
    end

    def push(el)
      # adds an element to the stack
      @ivar=@ivar+[]
    end

    def pop
      # removes one element from the stack
      @ivar=@ivar[0..-2]
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @ivar[-1]
    end
  end

  class Queue
    def initialize
        @ivar=[]
    end

    def enqueue(el)
        @ivar = [ele]+@ivar
    end

    def dequeue
        @ivar = @ivar[0..-2]
    end

    def peek
        @ivar[-1]
    end
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