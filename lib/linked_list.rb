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
      raise IndexError if n == 0 || current_item == nil 
      current_item = current_item.next_list_item 
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
    list_length, current_item = 0, @first_item
    while current_item != nil
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

  def [] n
    self.get n
  end

  def []= n, payload
    new_item, current_item, item_after_new  = LinkedListItem.new( payload ), @first_item, @first_item
    (n + 1).times do
      raise IndexError if n == 0 || item_after_new == nil 
      item_after_new = item_after_new.next_list_item 
    end

    if n != 0
      (n - 1).times do
        raise IndexError if n == 0 || current_item == nil 
        current_item = current_item.next_list_item 
      end
      current_item.next_list_item = new_item
    else
      @first_item = new_item
    end
    new_item.next_list_item = item_after_new
  end

  def remove n
    new_next_item, current_item  =  @first_item, @first_item

    (n + 1).times do
      raise IndexError if new_next_item == nil
      new_next_item = new_next_item.next_list_item 
    end

    if n > 0
      (n - 1).times do
        raise IndexError if current_item == nil
        current_item = current_item.next_list_item 
      end
      current_item.next_list_item = new_next_item
    else
      @first_item = new_next_item
    end
  end
end







