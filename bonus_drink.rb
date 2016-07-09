require 'lambda_driver'
require 'kansuu'

module BonusDrink
  extend Kansuu
  
  def bonus(n)
    n < 3 ? 0
    : (n / 3) + (bonus n / 3 + n % 3)
  end

  def total_count_for(n)
    n + (bonus n)
  end

  map[_.module_function] < instance_methods
end

#p BonusDrink.total_count_for 100 # => 149
