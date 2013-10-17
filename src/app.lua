for i = 1, #args do
  local str = string.format("Arg %i is %q", i, args[i])
  print(str)
end
