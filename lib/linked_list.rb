require 'linked_list_item'

class LinkedList
  attr_reader :first_item

  def initialize *args
    if args != []
      args.each do | arg | 
        self.add_item arg 
      end  
    end
  end

  def add_item payload 
    next_item = LinkedListItem.new payload
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

  def get n 
    current_item = @first_item
    n.times do
      if n != 0 && current_item != nil
        current_item = current_item.next_list_item 
      else
        raise IndexError
      end
    end
    current_item.payload
  end

  def last
      if @first_item != nil
        final_item = @first_item
        while !final_item.last?
          final_item = final_item.next_list_item
        end
        final_item.payload
      end  
  end

  def size
    list_size, current_item = 0, @first_item
    while current_item != nil
      current_item = current_item.next_list_item 
      list_size += 1
    end
    list_size
  end

  def to_s
    stringified_list, current_item = String.new, @first_item
    if current_item != nil
      stringified_list << "| "
      while current_item != nil
        stringified_list << current_item.payload
        stringified_list << ", " if !current_item.last?  
        current_item = current_item.next_list_item 
      end
      stringified_list << " |"
    else
      stringified_list << "| |"
    end  
    stringified_list
  end

  # ========= Bonus ========== #

  def [] n
    current_item = @first_item
    n.times do
      if n != 0 && current_item != nil
        current_item = current_item.next_list_item 
      else
        raise IndexError
      end
    end
    current_item.payload
  end

  def []= n, new_payload
    current_item = @first_item
    n.times do
      if n != 0 && current_item != nil
        current_item = current_item.next_list_item 
      else
        raise IndexError
      end
    end
    current_item.payload = new_payload
  end

  def remove(n)
  end

end
