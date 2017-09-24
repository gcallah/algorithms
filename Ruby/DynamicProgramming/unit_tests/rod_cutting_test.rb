require_relative '../rod_cutting'
require 'minitest/autorun'

class RodCuttingTest < Minitest::Test
  def test_cut_rod
    p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
    assert_equal(DynamicProgramming::RodCutting.cut_rod(p, 9), 25)
  end

  def test_memoized_cut_rod
    p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
    assert_equal(DynamicProgramming::RodCutting.memoized_cut_rod(p, 9), 25)
  end

  def test_memoized_cut_rod_with_recorder
    p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
    result = DynamicProgramming::RodCutting.memoized_cut_rod_with_recorder(p, 10)
    assert_equal(result, [
                           [1, 5, 8, 10, 13, 17, 18, 22, 25, 30],
                           [1, 2, 3, 2, 2, 6, 1, 2, 3, 10]
                          ]
                 )
  end

  def test_cut_locations
    p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
    result = DynamicProgramming::RodCutting.memoized_cut_rod_with_recorder(p, 10)
    assert_equal(DynamicProgramming::RodCutting.cut_locations(result.last, 7), [1, 6])
  end

  def test_sleek_memoized_cut_rod_aux
    p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
    assert_equal(DynamicProgramming::RodCutting.sleek_memoized_cut_rod_aux(p, 9), 25)
  end

  def test_bottom_up_cut_rod
    p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
    assert_equal(DynamicProgramming::RodCutting.bottom_up_cut_rod(p, 9), 25)
  end

  def test_extended_bottom_up_cut_rod
    p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]
    assert_equal(DynamicProgramming::RodCutting.extended_bottom_up_cut_rod(p, 9).first.last, 25)
  end
end
