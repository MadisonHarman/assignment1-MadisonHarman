def fib(n)
  if (n < 0) then # Upon assumption, n must be non-negative.
    return nil 
  end

  if (n == 0) then # If n is 0, then the sequence is empty, given the example.
    return [] 
  end

  if (n == 1) then # Finally, if n is 1, the sequence only has one element (0), given the example.
    return [0] 
  end

  sequence = [0, 1] # Add the terms (starting with [0, 1]) until we reach the length of n, appending the sum of the last two elements and printing the final sequence.
  while sequence.length < n 
    sequence << sequence[-1] + sequence[-2]
  end
  sequence
end

def isPalindrome(n)
  string = n.to_s # Convert n to a string (instead of checking the integer's assumptions) and then check if it is the same both ways (making it a palindrome).
  string == string.reverse
end

def nthmax(n, a)
  if (n < 0) then # Upon assumption, n must be non-negative.
    return nil 
  end

  if(a.empty?) then # If the array is empty, then you cannot find the maximum.
    return nil
  end

  if(n > a.length - 1) then # If n is greater than the length of the array minus one, then you are out of bounds and cannot find the nth maximum.
    return nil
  end

  values = a.uniq.sort.reverse # Get exclusively unique values from the array, sort them, and then reverse the order, allowing for the maximum to be returned first.
  values[n]
end

def freq(s)
  if(s.empty?) then # If the string has no characters, then an empty string is returned.
    return ""
  end

  if(s.length <= 2) then # The "most frequent" character will be the first character, even if there is a "tie".
    return s[0]
  end

  count = {} # Create a hash in order to count the frequency of each character and store it as key-value pairs.        
  s.each_char do |ch|    
    if count[ch]        
      count[ch] += 1
    else                                    
      count[ch] = 1
    end
  end

  max_char = nil 
  max_count = 0
  count.each do |ch, cnt| # Iterate through the hash we created beforehand in order to find the character with the highest frequency and return it.
    if cnt > max_count
      max_char = ch
      max_count = cnt
    end
  end

  max_char
end

def zipHash(arr1, arr2)
  return nil unless arr1.length == arr2.length # Make sure the two arrays are of equal lengths.

  hash = {} # Create a hash and iterate through the first array, assigning each element as a key and the corresponding element in the second array as its value, returning the hash at the end.
  arr1.each_with_index { |k, i| hash[k] = arr2[i] } 

  hash
end

def hashToArray(hash)
  if (hash.length == 0) then # If the hash is empty, then return an empty array.
    return [] 
  end

  hash.keys.map { |k| [k, hash[k]] } # Utilizing the keys.map method, create an array of arrays, where each sub-array is a key-value pair from the hash.
end
