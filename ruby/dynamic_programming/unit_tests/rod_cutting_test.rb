require_relative '../../unit_test'
require_relative '../rod_cutting'

def cut_rod_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  DynamicProgramming::RodCutting.cut_rod(p, 9) == 25
end

def memoized_cut_rod_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  DynamicProgramming::RodCutting.memoized_cut_rod(p, 9) == 25
end

def memoized_cut_rod_with_recorder_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  result = DynamicProgramming::RodCutting.memoized_cut_rod_with_recorder(p, 10)
  result == [
              [1, 5, 8, 10, 13, 17, 18, 22, 25, 30],
              [1, 2, 3, 2, 2, 6, 1, 2, 3, 10]
            ]
end

def cut_locations_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  result = DynamicProgramming::RodCutting.memoized_cut_rod_with_recorder(p, 10)
  DynamicProgramming::RodCutting.cut_locations(result.last, 7) == [1, 6]
end

def sleek_memoized_cut_rod_aux_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  DynamicProgramming::RodCutting.sleek_memoized_cut_rod_aux(p, 9) == 25
end

def bottom_up_cut_rod_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  DynamicProgramming::RodCutting.bottom_up_cut_rod(p, 9) == 25
end

def extended_bottom_up_cut_rod_test
  p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
  DynamicProgramming::RodCutting.extended_bottom_up_cut_rod(p, 9).first.last == 25
end

UnitTest.method('Cut rod', cut_rod_test)
UnitTest.method('Memoized cut rod', memoized_cut_rod_test)
UnitTest.method('Memoized cut rod Recorder', memoized_cut_rod_with_recorder_test)
UnitTest.method('Cut locations', cut_locations_test)
UnitTest.method('Sleek memoized cut rod', sleek_memoized_cut_rod_aux_test)
UnitTest.method('Bottom up cut rod', bottom_up_cut_rod_test)
UnitTest.method('Extended bottom up cut rod', extended_bottom_up_cut_rod_test)
