require_relative '../LCS'
require 'minitest/autorun'

class LCSTest < Minitest::Test
  def test_lcs_length
    x = "ABCBDAB"
    y = "BDCABA"
    assert_equal(DynamicProgramming::LCS.LCS_length(x, y).first[x.length][y.length], 4)
  end

  def test_lcs_print
    x = "ABCBDAB"
    y = "BDCABA"
    assert_equal(DynamicProgramming::LCS.print_LCS(DynamicProgramming::LCS.LCS_length(x, y).last, x, x.length, y.length), "BCBA")
  end
end
