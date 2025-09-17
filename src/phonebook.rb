class PhoneBook
  def initialize
	@namesHash = {} # The namesHash will store the names as keys and their corresponding phone numbers and listing status as values and the numbersHash will store vice versa.
	@numbersHash = {} 
  end

  def add(name, number, is_listed)
  if (@namesHash[name]) then # If the person already exists, then the entry cannot be added to the PhoneBook.
    return false 
  end

	if (!number.match?(/^\d{3}-\d{3}-\d{4}$/)) then # If number is not in the format NNN-NNN-NNNN, then the entry cannot be added to the PhoneBook, assuming phone numbers will not start with 0.
    return false 
  end

	if (@numbersHash[number] && is_listed) then # A number can be added as unlisted multiple times but it cannot already exist in the PhoneBook if it is already listed.
    return false 
  end

	@namesHash[name] = { number: number, is_listed: is_listed } 
	
  if (is_listed) then # Add the number to the numbersHash if it is listed ONLY.
		@numbersHash[number] = name
	end

	true
  end

  def lookup(name)
	serchedEntry = @namesHash[name]

	if (serchedEntry && serchedEntry[:is_listed]) then # If the entry exists and is listed, return the corresponding phone number. Otherwise, return nil.
		return serchedEntry[:number]
	else
		return nil
	end
  
  end

  def lookupByNum(number)
    numberLookup = @numbersHash[number]

    if (numberLookup && @namesHash[numberLookup][:is_listed]) then # If the number exists and is listed, return the corresponding name. Otherwise, return nil.
      return numberLookup
    else
      return nil
    end

  end

  def namesByAc(areacode)
    @namesHash.select { |_name, details| details[:number].start_with?(areacode) }.keys # Select all names whose phone numbers start with the given area code and return them as an array.
  end
end
