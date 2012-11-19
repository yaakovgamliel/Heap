module Ownerise
  def ownerise(word=self.to_s)
    if word =~ /s$/
      "#{word}'"
    else
      "#{word}'s"
    end
  end

  alias s ownerise
end
