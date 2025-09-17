require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class StudentTests < Minitest::Test # Had to use Minitest instead of MiniTest because of my version of Ruby.
    def setup
        @phonebook = PhoneBook.new
    end

  # Extra tests for warmup.rb:

    def test_student_fib
        expectedList = [0, 1, 1, 2, 3]  # Doing a quick test on the first 5 Fibonacci numbers, ensuring correctness with a list.
        assert_equal(expectedList, fib(5))
    end

  def test_student_ispalindrome
    assert_equal(true, isPalindrome(34567876543)) # Testing palindrome with larger numbers.
    assert_equal(false, isPalindrome(3456706543))
  end

  def test_student_nthmax
    arr = [7, 7, 5] # Tests with duplicate max values, ensuring it is handled correctly.
    assert_equal(7, nthmax(0, arr))   
    assert_equal(5, nthmax(1, arr))  
    assert_nil(nthmax(2, arr))        
  end

  def test_student_freq
    assert_equal("b", freq("bbbbbbbbb")) # Testing the frequency with a string of the same character.
  end

  def test_student_ziphash
    assert_nil(zipHash([5, 6, 7], [5, 6])) # Tests unequal length arrays (the first value being the longer one this time).
  end

  def test_student_hashtoarray
    hash = { "five" => 5, "six" => 6, "seven" => 7 } # Testing a hash that has string keys and integer values.
    assert_equal([["five", 5], ["six", 6], ["seven", 7]], hashToArray(hash))
  end

  # Extra tests for phonebook.rb:

def test_student_phonebook_add
    assert_equal(true, @phonebook.add("Walter", "777-777-7777", true)) # Adding the same number as unlisted and then listed.
    assert_equal(false, @phonebook.add("Jesse", "777-777-7777", true))
  end

  def test_student_phonebook_lookup
    assert_equal(true, @phonebook.add("Saul", "505-503-4455", false)) # Adding and looking up unlisted entries.
    assert_equal(true, @phonebook.add("Kim", "505-503-4455", false))
    assert_nil(@phonebook.lookup("Saul")) 
    assert_nil(@phonebook.lookupByNum("505-503-4455")) 
  end

  def test__student_lookup_by_num
    assert_nil(@phonebook.lookupByNum("888-888-8888")) # Looking up a number that is assumed to not exist in the phonebook.
  end

  def test_student_names_by_ac
    @phonebook.add("Gus", "777-654-3210", false) # Adding both unlisted and listed entries with the same area code.
    @phonebook.add("Jane", "777-123-4567", true)
    @phonebook.add("Hector", "888-222-3333", false)

    result = @phonebook.namesByAc("777")
    assert_equal(["Gus", "Jane"].sort, result.sort)
  end
end

