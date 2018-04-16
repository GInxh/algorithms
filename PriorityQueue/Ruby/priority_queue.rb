class PriorityQueue
  attr_reader :keys, :size

  def initialize
    @keys = [nil]
    @size = nil
  end

  def size
    @size = (@keys.size - 1)
  end

  # PQ Ops
  def isEmpty? 
    size
    return @size == 0
  end

  # compares <= 1 + logN
  def <<(key)
    @keys << key
    size
    swim(@size)
  end

  # compares <= 2LogN
  def pop
    max = @keys[1]
    exch(1, @size)
    @keys.pop
    size
    sink(1)
    return max
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
    return (@keys[i] < @keys[j])
  end

  private
  def exch(i, j)
    @keys[i], @keys[j] = @keys[j], @keys[i]
  end
end
