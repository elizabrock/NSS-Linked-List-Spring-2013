class LinkedListItem
  attr_reader :next_list_item
  attr_reader :payload

  def initialize( payload )
  	@payload = payload
  end

  def next_list_item= ( linked_list_item )
  	if self != linked_list_item
  		@next_list_item = linked_list_item
  	else
  		raise ArgumentError, "Cannot set self as next list item"
  	end	
  end

  def last?
  	next_list_item.nil?
  end
end
