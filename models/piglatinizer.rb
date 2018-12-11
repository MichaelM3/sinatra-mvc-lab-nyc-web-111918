class PigLatinizer

  attr_reader :text

  def initialize(text)
    @text = text.downcase
  end

  def translation
    alpha = ('a'..'z').to_a
    vowels = %w[a e i o u]
    consonants = alpha - vowels
    arrayOfText = text.split
    pigLatinTranslator = arrayOfText.map do |word|
      if vowels.include?(word[0])
        word + 'ay'
      elsif consonants.include?(word[0]) && consonants.include?(word[1])
        word[2..-1] + word[0..1] + 'ay'
      elsif consonants.include?(word[0])
        word[1..-1] + word[0] + 'ay'
      else
        word
      end
    end
    pigLatinTranslator.join(" ").capitalize
  end
end
