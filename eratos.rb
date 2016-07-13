require 'lambda_driver'
require 'kansuu'

module Eratos
  extend Kansuu

  def _prime_numbers
    f = -> ns {
      first[ns] <= last[ns] ** 0.5 ?
        take[1][ns] + f[reject[
          rem[first[ns]] >> is[0]
        ][ns]]
      : ns
    }
  end

  def prime_numbers
    range[2] >> _prime_numbers
  end

  map[_.module_function, instance_methods]
end

# コマンドラインから呼び出し
extend Kansuu
(first >> may[
  to_i >>
  Eratos.prime_numbers >>
  _.puts
]) < $*
