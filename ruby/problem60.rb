require './util'

def concat_to_num n1, n2
  (n1.to_s + n2.to_s).to_i
end

def get_result
  Util::get_primes(1_000).combination(5) do |combo|
    pairs = combo.permutation(2)
    all_prime = pairs.all? do |pair|
      concat_to_num(pair[0], pair[1]).prime?
    end

    return combo if all_prime
  end
end

p result = get_result
puts result.reduce(:+)