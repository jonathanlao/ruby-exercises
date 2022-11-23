def caesar_cipher(str, shift)
  cipher = str.chars.map do |char|
    ord = char.ord
    if ord.between?(97, 122)
      max = 122
    elsif ord.between?(65, 90)
      max = 90
    else
      next(char)
    end
    ord += shift
    ord -= 26 while ord > max
    ord.chr
  end
  cipher.join
end

p caesar_cipher("What a stringz!", 100)