require 'lambda_driver'
require 'kansuu'

module Triangle
  extend Kansuu

  def type
    -> xs {
        any[gte[sum[xs] / 2.0]] < xs ?
          '非三角形' : %w(正三角形 二等辺三角形 不等辺三角形).at(xs.uniq.length - 1)
    }
  end

  module_function :type
end

# コマンドラインから呼び出し
extend Kansuu
$*.revapply when_[length >> gt[0],
  map[to_i] >>
  Triangle.type >>
  _.puts
]

