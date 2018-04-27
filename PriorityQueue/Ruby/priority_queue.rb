class PriorityQueue
  attr_reader :elements, :size

  def initialize(capacity)
    @size = 0
    cap = capacity + 1
    @elements = Array.new(cap)
  end

  def resize
   @size += 1
  end

  def downsize
    # prevent loitering
    @elements[@size] = nil
    @size -= 1
  end

  def isEmpty? 
    return @size == 0
  end

  # compares <= 1 + logN
  def <<(key)
    resize
    @elements[@size] = key
    swim(@size)
  end

  # compares <= 2LogN
  def pop
    if @size <= 0
      raise RuntimeError, "priority queue is empty. Unable to pop more elements"
    else
      max = @elements[1]
      exch(1, @size) 
      downsize
      sink(1)
      return max
    end 
  end

  # heap helpers
  private
  def swim(k)
    # while not root and k's parent < k
    while k > 1 && less?(k/2, k) 
        exch(k, k/2)
        k = k/2
    end
  end

  private
  def sink(k)
    # j = child
    while 2*k <= @size
      j = 2*k
      # get the largest child
      if j < @size && less?(j, j+1)
        j += 1
      end
      #if parent not < largest child
      if !less?(k,j)
        break
      end
      exch(k, j)
      k = j
     end
  end

  # array helpers
  private
  def less?(i, j)
    return (@elements[i] < @elements[j])
  end

  private
  def exch(i, j)
    @elements[i], @elements[j] = @elements[j], @elements[i]
  end
end
