require './caesar.rb'

describe CaesarCipher do
  cipher = CaesarCipher.new

  it "shifts single characters" do
    expect(cipher.encode("a", 1)).to eql("b")
  end
  it "reverse shifts single characters" do
    expect(cipher.encode("b", -1)).to eql("a")
  end
  it "wraps single characters" do
    expect(cipher.encode("z", 1)).to eql("a")
  end
  it "reverse wraps single characters" do
    expect(cipher.encode("a", -1)).to eql("z")
  end
  it "wraps capital characters" do
    expect(cipher.encode("A", -1)).to eql("Z")
  end
  it "does not affect punctuation" do
    expect(cipher.encode("Hello, World!", 1)).to eql("Ifmmp, Xpsme!")
  end
  it "wraps for large positive values" do
    expect(cipher.encode("a", 26*5 + 1)).to eql("b")
  end
  it "wraps for large negative values" do
    expect(cipher.encode("a", -26*5 + 1)).to eql("b")
  end

end
