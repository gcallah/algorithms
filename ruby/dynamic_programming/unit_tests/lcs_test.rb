require_relative '../../unit_test'
require_relative '../LCS'

def lcs_length_test
  x = "ABCBDAB"
  y = "BDCABA"
  DynamicProgramming::LCS.LCS_length(x, y).first[x.length][y.length] == 4
end

def print_lcs_test
  x = "ABCBDAB"
  y = "BDCABA"
  DynamicProgramming::LCS.print_LCS(DynamicProgramming::LCS.LCS_length(x, y).last, x, x.length, y.length) == "BCBA"
end

UnitTest.method('LCS Length', lcs_length_test)
UnitTest.method('Print LCS', print_lcs_test)
