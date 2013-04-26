require 'linked_list_item'

class LinkedList
  attr_reader :first_item

  def initialize *args
    args.each do |arg|
      add_item(arg)
    end
  end

  def add_item(payload)
    next_item =  LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = next_item
    else
      final_item = @first_item
      while !final_item.last?
        final_item = final_item.next_list_item
      end
      final_item.next_list_item = next_item
    end
  end

  def get_item(n)
    raise IndexError if n < 0
    item = @first_item
    n.times do
      raise IndexError if item.nil?
      item = item.next_list_item
    end
    item #LinkedListItem
  end

  def get(n)
    get_item(n).payload #payload
  end

  def last
    item = @first_item
    return nil if item.nil?
    until item.last?
      item = item.next_list_item
    end
    return item.payload
  end

  def size
    item = @first_item
    size = 0
    until item.nil?
      item = item.next_list_item
      size += 1
    end
    size
  end

  def to_s
    current_item = @first_item
    payloads = ""
    while current_item
      payloads += " "
      payloads += current_item.payload.to_s
      payloads += "," unless current_item.last?
      current_item = current_item.next_list_item
    end
    "|#{payloads} |"
  end

  # ========= Bonus ========== #

  def [](n)
    get(n)
  end

  def []=(n, payload)
    prev = get_item(n-1)
    oldnext = prev.next_list_item
    newnext = LinkedListItem.new(payload)
    prev.next_list_item = newnext
    newnext.next_list_item = oldnext.next_list_item
  end

   def remove(n)
    if n >= size
      raise IndexError, "cannot remove node at position #{n}, as it does not exist"
    end
    if n == 0
      @first_item = @first_item.next_list_item
    else
      before = get_item(n-1)
      node = get_item(n)
      before.next_list_item = node.next_list_item
    end
  end

  # ========= Index Exercise ========== #

  def indexOf(payload)
    item = @first_item
    i = 0
    while item
      if item.payload == payload
        return i
      end
      item = item.next_list_item
      i += 1
    end
  end
    # ========= Sorting Exercise ========== #

  def sorted?
    item = @first_item
    return true unless item
    while item
      return true if item.last?
      return false if item > item.next_list_item
      item = item.next_list_item
    end
  end

  def sort
  end

  def swap_with_next i
    raise IndexError if i + 1 >= size
    current_item = get_item(i)
    next_item = get_item(i+1)

    if i - 1 >= 0
      previous_item = get_item( i-1)
      previous_item.next_list_item = next_item
    else
      @first_item = next_item
    end

    current_item.next_list_item = next_item.next_list_item
    next_item.next_list_item = current_item
  end

end
