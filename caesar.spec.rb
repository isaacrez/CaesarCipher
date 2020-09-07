require './caesar'

def test(expected, actual)
    puts expected == actual ? "Passed" : "Failed"
    puts "\n"
end

puts "One character"
test("b", caesar_cipher("a", 1))

puts "Negative shift"
test("a", caesar_cipher("b", -1))

puts "Punctuation unaffected"
test("Ifmmp, Xpsme!", caesar_cipher("Hello, World!", 1))

puts "Wraps"
test("a", caesar_cipher("z", 1))

puts "Wraps negatively"
test("z", caesar_cipher("a", -1))

puts "Wraps for large values"
test("a", caesar_cipher("z", 1 + 26*5))

puts "Wraps for large negative values"
test("z", caesar_cipher("a", -1 - 26*3))

puts "Wraps for negative char codes"
test("z", caesar_cipher("a", -1 - 26*10))