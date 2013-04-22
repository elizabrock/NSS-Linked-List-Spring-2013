require 'linked_list_item'

class LinkedList
  attr_reader :first_item

  def initialize ( *args )
    args.each do | arg | 
      add_item arg 
    end  
  end

  def add_item ( payload )
    next_item = LinkedListItem.new ( payload )

    if @first_item.nil?
      @first_item = next_item
    else
      final_item = @first_item
      until final_item.last?
        final_item = final_item.next_list_item
      end
        final_item.next_list_item = next_item
    end
  end

  def find_item ( n )
    current_item = @first_item

    n.times do
      raise IndexError if current_item.nil? 
      current_item = current_item.next_list_item 
    end

    current_item
  end

  def get ( n )
    find_item( n ).payload
  end

  def last
    unless @first_item.nil?
      final_item = @first_item
      until final_item.last?
        final_item = final_item.next_list_item
      end
      final_item.payload
    end  
  end

  def size
    list_length, current_item = 0, @first_item

    until current_item.nil?
      current_item = current_item.next_list_item 
      list_length += 1
    end

    list_length
  end

    def to_s
    list_items, current_item = String.new, @first_item

    while current_item != nil
      list_items << " "
      list_items << current_item.payload
      list_items << "," unless current_item.last?  
      current_item = current_item.next_list_item 
    end 

    "|#{list_items} |"
  end

  # ========= Bonus ========== #

  def [] ( n )
    get n
  end

  def []= ( n, payload )
    find_item( n ).payload = payload
  end

  def remove ( n )
    next_item, prev_item = @first_item, @first_item

    ( n + 1 ).times do
      raise IndexError if next_item == nil
      next_item = next_item.next_list_item 
    end

    if n > 0
      ( n - 1 ).times do
        raise IndexError if prev_item == nil
        prev_item = prev_item.next_list_item 
      end
      prev_item.next_list_item = next_item
    else
      @first_item = next_item
    end
  end

end







