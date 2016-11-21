require_relative '../../unit_test'
require_relative '../rod_cutting'

def cut_rod_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  DynamicProgramming::RodCutting.cut_rod(p, 9) == 25
end

def memoized_cut_rod_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  DynamicProgramming::RodCutting.cut_rod(p, 9) == 25
end

def sleek_memoized_cut_rod_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  DynamicProgramming::RodCutting.sleek_cut_rod(p, 9) == 25
end

def bottom_up_cut_rod_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  DynamicProgramming::RodCutting.bottom_up_cut_rod(p, 9) == 25
end

def extended_bottom_up_cut_rod_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  p DynamicProgramming::RodCutting.extended_bottom_up_cut_rod(p, 9)
end

UnitTest.test('Cut rod', cut_rod_test)
UnitTest.test('Memoized cut rod', memoized_cut_rod_test)
UnitTest.test('Sleek memoized cut rod', sleek_memoized_cut_rod_test)
UnitTest.test('Bottom up cut rod', bottom_up_cut_rod_test)
# UnitTest.test('Extended bottom up cut rod', extended_bottom_up_cut_rod_test)

# extended_bottom_up_cut_rod_test
