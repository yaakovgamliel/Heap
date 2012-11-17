class Token
  def self.generate(length=8,characters = :alphanumeric)
    case characters
    when :alphanumeric
      (1..length).collect { (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }.join
    when :numeric
      rand(10**length).to_s
    when :fixed_numeric
      rand(10**length).to_s.rjust(length,rand(10).to_s)
    when :alpha
      Array.new(length).map{['A'..'Z','a'..'z'].map{|r|r.to_a}.flatten[rand(52)]}.join
    end
  end
end
