require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do
  specify { expect(Triangle.type < [1, 1, 1]).to eq "正三角形" }
  specify { expect(Triangle.type < [2, 1, 1]).to eq "非三角形" }
  specify { expect(Triangle.type < [2, 2, 1]).to eq "二等辺三角形" }
  specify { expect(Triangle.type < [4, 3, 2]).to eq "不等辺三角形" }
end

