class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    # TODO: Implement this method
    
    
    # I will use the standard alphanumeric definition of a "word"
    
    regex_1 = /[a-z0-9_]\w{4,}/  # replacement regex for words greater than 4 letters that start with lowercase
    regex_2 = /[A-Z]\w{4,}/  #replacement regex for words greater than 4 letter beginning with uppercase
    
    #run regex replacements in the string
    str.gsub!(regex_1, "marklar")
    str.gsub!(regex_2, "Marklar")
    
    return str
    
=begin
     
     #another way without traversing the string twice with gsub
     
     regex_1 = /^[a-z0-9_]\w{4,}/
     regex_2 = /^[A-Z]\w{4,}/
     
     str_array = str.split(" ")
     
     str_array.each do |str_frag|
     
     if str_frag.match(regex_1) != nil
     str_frag.gsub!(regex_1, "marklar")
     elsif str_frag.match(regex_2) != nil
     str_frag.gsub!(regex_2, "Marklar")
     end
     
     end
     
     str = str_array.join(" ")
     
     return str
     
=end
    
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    # TODO: Implement this method

=begin
        First we try and find a way to find every even Fibonacci term.
        We notice that the Fibonacci sequence is F(n) = F(n-2) + F(n-1), for integer n > 1 and F(0)=0, F(1)=1
        
        The sequence goes 0, 1,1,2, 3,5,8  13,21,34 ....
        
        It seems the pattern goes {odd, odd, even}. So, for integer k >= 1
        F(1), F(4), F(7)...F(3k - 2) is odd
        F(2), F(5), F(8)...F(3k - 1) is odd
        F(3), F(6), F(9)...F(3k) is even
     
        Let's prove this formula is true.
     
     
     
        NOTE!!!: Recall an even number is of the form 2j and an odd number is of the form 2j+1, for some integer j
     
     
     
        Proof: By induction, we have our base case, which holds for the case k=1 (1,1,2), so let's assume that the statement holds for some integer k. We want to prove that k+1 holds.
     
            By our assumption, let's say F(3k-2) = 2b+1, F(3k-1) = 2c+1, F(3k) = 2d, for positive ints b,c,d.
            
            We want to know if F(3(k+1)-2), F(3(k+1)-1), F(3(k+1)) are even or odd. Following our the Fibonacci formula:
            
            F(3(k+1)-2) = F(3(k+1)-4) + F(3(k+1)-3) = F(3k-1) + F(3k) = 2c+1 + 2d = 2(c+d)+1. c+d is an integer, so
            F((3(k+1)-2 is odd.
     
            F(3(k+1)-1) = F(3(k+1)-3) + F(3(k+1)-2) = F(3k) - F(3(k+1)-2) = 2d + 2(c+d)+1 = 2(c+2d)+1. c+2d is an integer, so F(3(k+1)-1) is odd.
     
            F(3(k+1)) = F(3(k+1)-2) + F(3(k+1)-1) = 2(c+d)+1 + 2(c+2d)+1 = 2(c+d)+2(c+2d)+2 = 2(2c+3d+1). Since 2c+3d+1 is an integer, F(3(k+1)) is even.
     
            So, for integer k >= 1
            F(1), F(4), F(7)...F(3k - 2) is odd
            F(2), F(5), F(8)...F(3k - 1) is odd
            F(3), F(6), F(9)...F(3k) is even 
            ### END PROOF ###
     
        Using our formula, we know that the nth Fibonacci number is even if n is a multiple of 3.
     
        To calculate the Fibonacci numbers, we can use the recursive definition, or the closed form:
        
        F(n) = (1/sqrt(5))*((1+sqrt(5))/2)**n - (1/sqrt(5))*((1-sqrt(5))/2)**n
     
        https://en.wikipedia.org/wiki/Fibonacci_number#Closed-form_expression
     
        Thus, to find the sum of all even fibonacci numbers up to the nth term,
        we add F(3) + F(6) + F(9) + ... + F(3k), where 3k < n, and k>=1 is an integer.
    
=end

    counter = 1
    even_fib_total = 0;

    while 3*counter <= nth
    
        # Used closed fib formula to find F(3*counter)
        new_fib_val = (1/Math.sqrt(5))*((1+Math.sqrt(5))/2)**(3*counter) - (1/Math.sqrt(5))*((1-Math.sqrt(5))/2)**(3*counter)
    
        # fix rounding due to computer calculations and add to the previous even fibonacci total
        even_fib_total += new_fib_val.round
        counter+=1
    end

    return even_fib_total

  end #even_fibonacci

end
