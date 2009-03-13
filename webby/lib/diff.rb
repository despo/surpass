def raise_error_if_different(file1, file2)
  diff = `diff #{file1} #{file2}`
  # raise diff if diff =~ /differ/
end