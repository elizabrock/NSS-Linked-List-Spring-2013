require 'test/unit'
require 'linked_list'

class LinkedListTest < Test::Unit::TestCase

  def test_06_add_item_get_item
    ll = LinkedList.new
    payload = "foo"
    ll.add_item(payload)
    assert_equal(payload, ll.get(0))
  end

  def test_06b_add_item_get_item
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    assert_equal("foo", ll.get(0))
  end

  def test_06c_add_item_get_item
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    assert_equal("bar", ll.get(1))
  end

  def test_07_add_multiple_items_get_item
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    ll.add_item("zoo")
    assert_equal("grille", ll.get(2))
  end

  def test_08a_get_negative_index_raises_index_error
    ll = LinkedList.new("a")
    assert_raise IndexError do
      ll.get(-1)
    end
  end

  def test_08_get_item_that_doesnt_exist
    ll = LinkedList.new
    assert_raise IndexError do
      ll.get(1)
    end
  end

  def test_08b_get_item_that_doesnt_exist
    ll = LinkedList.new
    ll.add_item("bar")
    assert_raise IndexError do
      ll.get(2)
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

  def test_10b_list_size
    ll = LinkedList.new
    ll.add_item("foo")
    ll.add_item("bar")
    assert_equal( 2, ll.size)
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
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("grille")
    assert_equal '| foo, bar, grille |', ll.to_s
  end

  # # ========= Bonus ========== #

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
    ll.remove(2)

    assert_equal '| foo, bar |', ll.to_s
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

  def test_24_remove_item_from_end_of_list
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


  # ========= Index exercise ========== #

  def test_26_index_of_first_item
    ll = LinkedList.new()
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("good")
    assert_equal(0, ll.indexOf("foo"))
  end

  def test_27_index_of_middle_item
    ll = LinkedList.new()
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("good")
    assert_equal(1, ll.indexOf("bar"))
  end

  def test_28_index_of_last_item
    ll = LinkedList.new()
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("good")
    assert_equal(2, ll.indexOf("good"))
  end

  def test_29_index_of_last_item
    ll = LinkedList.new()
    ll.add_item("foo")
    ll.add_item("bar")
    ll.add_item("good")
    assert_equal(nil, ll.indexOf("terrible"))
  end

  def test_30_index_of_last_item
    ll = LinkedList.new()
    assert_equal(nil, ll.indexOf("terrible"))
  end

  def test_31_index_of_duplicate
    ll = LinkedList.new()
    ll.add_item("foo")
    ll.add_item("foo")
    ll.add_item("good")
    assert_equal(0, ll.indexOf("foo"))
  end

  def test_32_index_of_empty_list
    ll = LinkedList.new()
    assert_equal(nil, ll.indexOf("foo"))
  end

  def test_33_empty_list_sorted
    ll = LinkedList.new()
    assert ll.sorted?
  end

  def test_34_single_item_list_sorted
    ll = LinkedList.new("foo")
    assert ll.sorted?
  end

  def test_35_duplicates_sorted
    ll = LinkedList.new("foo", "foo")
    assert ll.sorted?
  end

  def test_36_unsorted_list_sorted
    ll = LinkedList.new("foo", "bar")
    assert !ll.sorted?
  end

  def test_37_sorted_list_sorted
    ll = LinkedList.new("bar", "foo")
    assert ll.sorted?
  end

  def test_38_list_with_multiple_unsorted_types_sorted
    ll = LinkedList.new(:b, "foo", 1, "bar", 2)
    assert !ll.sorted?
  end

  def test_39_list_with_multiple_sorted_types_sorted
    ll = LinkedList.new(1, 2, "bar", "foo", :b)
    assert ll.sorted?
  end

  def test_40_sort_empty_list
    ll = LinkedList.new()
    sortedll = ll.sort
    assert_equal( "| |", sortedll.to_s)
  end

  def test_41_sort_single_item_list
    ll = LinkedList.new("foo")
    sortedll = ll.sort
    assert_equal( "| foo |", sortedll.to_s)
  end

  def test_42_sort_duplicates
    ll = LinkedList.new("foo", "foo")
    sortedll = ll.sort
    assert_equal( "| foo, foo |", sortedll.to_s)
  end

  def test_43_sort_unsorted_list
    ll = LinkedList.new("foo", "bar")
    sortedll = ll.sort
    assert_equal( "| bar, foo |", sortedll.to_s)
  end

  def test_44_sort_sorted_list
    ll = LinkedList.new("bar", "foo")
    sortedll = ll.sort
    assert_equal( "| bar, foo |", sortedll.to_s)
  end

  def test_45_sort_longer_list
    ll = LinkedList.new("bar", "adda", "grille", "abba", "foo")
    sortedll = ll.sort
    assert_equal( "| abba, adda, bar, foo, grille |", sortedll.to_s)
  end

  def test_46_sort_list_with_multiple_types
    ll = LinkedList.new(:b, "foo", 1, "bar", 2)
    sortedll = ll.sort
    assert_equal( "| 1, 2, bar, foo, b |", sortedll.to_s)
  end

  #=== Useful for bubble sort: ===#

  def test_47_swap_middle_items
    ll = LinkedList.new("a","b","c","d")
    assert_equal "| a, b, c, d |", ll.to_s
    ll.swap_with_next(1)
    assert_equal "| a, c, b, d |", ll.to_s
  end

  def test_48_swap_first_item
    ll = LinkedList.new("a","b","c","d")
    assert_equal "| a, b, c, d |", ll.to_s
    ll.swap_with_next(0)
    assert_equal "| b, a, c, d |", ll.to_s
  end

  def test_49_swap_middle_items
    ll = LinkedList.new("a","b","c","d")
    assert_equal "| a, b, c, d |", ll.to_s
    ll.swap_with_next(2)
    assert_equal "| a, b, d, c |", ll.to_s
  end

  def test_50_swap_last_item
    ll = LinkedList.new("a","b","c","d")
    assert_equal "| a, b, c, d |", ll.to_s
    assert_raise IndexError do
      ll.swap_with_next(3)
    end
  end
end
