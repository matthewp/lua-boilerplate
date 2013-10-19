local function hi()
  print("Hi from another module!\n")
end

return {
  hi = hi
}
