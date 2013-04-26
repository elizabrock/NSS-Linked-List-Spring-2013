class LinkedListItem
  include Comparable
  attr_reader :next_list_item
  attr_reader :payload

  def initialize( thatthing )
    @payload = thatthing
  end

  def next_list_item=(linked_list_item)
    if self === linked_list_item
      raise ArgumentError
    end
    @next_list_item = linked_list_item
  end

  def last?
    @next_list_item.nil?
  end

  def === other_item
    self.object_id == other_item.object_id
  end

  def <=> other
    # Comparators return -1, 0, or 1 to indicate > , ==, or <
    # Precedence: integers, then strings, then symbols (each sorted
    # individually)
    if self.payload.class == other.payload.class
      # I implemented this basic comparison for you.
      return self.payload <=> other.payload
    end

    return 1 if self.payload.is_a? Symbol
    return -1 if self.payload.is_a? Integer

    # If I'm a string, use the fallback:
    -1 * (other <=> self)
  end
end
