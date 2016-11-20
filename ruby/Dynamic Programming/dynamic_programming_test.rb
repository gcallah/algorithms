def test(method_name, method_test)
  if method_test
    p "#{method_name} OK"
  else
    p "#{method_name} FAIL"
  end
end
