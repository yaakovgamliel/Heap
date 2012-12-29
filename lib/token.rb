class Token
  def self.generate(length=8,format=:alphanumeric)
    (1..length).collect { self.send("_generate_#{format}_char") }.join
  end

  private

  def self._generate_alphanumeric_char
    (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr
  end

  def self._generate_numeric_char
    rand(9)
  end

  def self._generate_alpha_char
    (('a'..'z').to_a + ('A'..'Z').to_a).shuffle.first
  end
end
