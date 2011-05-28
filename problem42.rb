require 'set'

def get_triangle(n)
	(1..n).map {|x| 0.5 * x *(x + 1) }.map {|x| x.to_i }
end

def score_word(scores, word)
	word.downcase.chars.map {|c| scores[c]}.reduce(:+)
end

letters = %w"a b c d e f g h i j k l m n o p q r s t u v w x y z"
letter_scores = {}
letters.each_with_index {|l, i| letter_scores[l] = i + 1 }

contents = ""
File.open("words.txt") {|file| contents = file.read }
contents.gsub!('"', '')
scores = contents.split(",").map {|word| score_word(letter_scores, word) }
triangles = Set.new get_triangle(1000)
puts scores.select {|s| triangles.include? s }.length
