require 'test/unit'
require 'linked_list'

class LinkedListItemTest < Test::Unit::TestCase

  def test_06_add_item_get_item
    ll = LinkedList.new
    ll.add_item("foo")
    assert_equal("foo", ll.get(0))
  end

  def test_07_add_multiple_items_get_item
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    assert_equal("grille", ll.get(2))
  end

  def test_08_get_item_that_doesnt_exist
    ll = LinkedList.new
    assert_raise IndexError do
      ll.get(1)
    end
  end

  def test_09_new_list_size_is_0
    assert_equal(0, LinkedList.new.size)
  end

  def test_10_list_size
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    assert_equal( 3, ll.size)
  end

  def test_11_last_item_for_an_empty_list
    ll = LinkedList.new
    assert_equal(nil, ll.last)
  end

  def test_12_last_item_for_a_list_with_items
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    assert_equal("grille", ll.last)
  end

  def test_13_to_s_an_empty_linked_list
    ll = LinkedList.new
    assert_equal("| |", ll.to_s)
  end

  def test_14_to_s_a_single_item_list
    ll = LinkedList.new
    ll.add_item("foo")
    assert_equal('| foo |', ll.to_s)
  end

  def test_15_to_s_a_long_list
    ll = LinkedList.new
    ll.add_item ("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    assert_equal '| foo, bar, grille |', ll.to_s
  end

  # ========= Bonus ========== #

  def test_16_initialize_takes_seed_argument
    ll = LinkedList.new("foo")
    assert_equal "| foo |", ll.to_s
  end

  def test_17_initialize_takes_seed_arguments
    ll = LinkedList.new("foo", "bar", "grille")
    assert_equal '| foo, bar, grille |', ll.to_s
  end

  def test_18_bracket_accessor
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    assert_equal("grille", ll[2])
  end

  def test_19_bracket_assignment
    ll = LinkedList.new("foo", "bar", "grille")
    ll[1] = "bar-be-que"
    assert_equal("bar-be-que", ll[1])
  end

  def test_20_bracket_assignment_results
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    ll[1] = "bar-be-que"
    assert_equal '| foo, bar-be-que, grille |', ll.to_s
  end

  def test_21_remove_item_changes_size
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    ll.remove(2)

    assert_equal(2, ll.size)
  end

  def test_22_remove_item_removes_correct_item
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    # ll.remove(2)

    # assert_equal '| foo, bar |', ll.to_s
    ll.remove(1)

    assert_equal '| foo, grille |', ll.to_s
  end

  def test_23_remove_item_from_beginning_of_list
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    ll.remove(0)

    assert_equal '| bar, grille |', ll.to_s
  end

  def test_24_remove_item_from_middle_of_list
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    ll.add_item("dog")
    ll.add_item("elephant")
    ll.remove(2)

    assert_equal '| foo, bar, dog, elephant |', ll.to_s
  end

  def test_24b_remove_item_from_end_of_list
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    ll.add_item("dog")
    ll.add_item("elephant")
    ll.remove(4)
    
    assert_equal '| foo, bar, grille, dog |', ll.to_s
  end

  def test_25_remove_item_that_doesnt_exist
    ll = LinkedList.new
    assert_raise IndexError do
      ll.remove(1)
   end
  end

end
