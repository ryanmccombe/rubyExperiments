# Interps alphabet from ASCII to 0 - 25,  wraps offset using %, then interps back into correct ASCII range:
#   Uppercase: +65 (A = 65, Z = 90)
#   Lowercase: +97 (a = 97, z = 122)

def caesar_cipher(input, rot)
  output = ""
  input.each_byte do |c|
    if (65..90) === c
      output << ((c+rot-65)%26+65).chr
    elsif (97..122) === c
      output << ((c+rot-97)%26+97).chr
    else
      output << c.chr
    end
  end
  output
end