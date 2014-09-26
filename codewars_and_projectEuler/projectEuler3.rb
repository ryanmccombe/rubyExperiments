###
#   The prime factors of 13195 are 5, 7, 13 and 29.
#   What is the largest prime factor of the number 600851475143 ?

def isPrime(n)
  if n<2
    return false
  end
# An integer is prime if it is not divisible by any prime less than or equal to its square root
  root = Math.sqrt(n)
  i = 2
  while i <= root
    if n%i == 0
      return false
    end
    i = i+1
  end
  return true
end

def generatePrimes(n)
  arr = []
  i=1
  while i <= n
    if isPrime(i)
      arr.push(i)
    end
    i=i+1
  end
  arr
end

def primeFactors(n, primes)
  remainder = n
  factors = []
  while remainder > 1
    i = 0
    while remainder%primes[i] != 0
      i=i+1
    end
    remainder = remainder / primes[i]
    factors.push(primes[i])
  end
  factors
end

target=600851475143
primes=generatePrimes(10000)

puts primeFactors(target,primes).max()