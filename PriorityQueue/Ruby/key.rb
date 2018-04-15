class Key
  include Comparable

  attr_accessor :name, :priority

  def initialize(name)
    @name, @priority = name, priority
  end

  def <=>(other)
    @priority <=> other.priority
  end
end
