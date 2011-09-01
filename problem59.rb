require './util'



def decrypt
  dictionary = DictionaryOfCommonWords.new
  contents = ""
  File.open("cipher1.txt") {|file| contents = file.read }
  encrypted = contents.split(",").to_a

  (97..122).each do |first|
    (97..122).each do |second|
      (97..122).each do |third|
        result = ""
        encrypted.each_slice(3) do |e|
          result << (e[0].to_i ^ first).chr
          result << (e[1].to_i ^ second).chr
          result << (e[2].to_i ^ third).chr
        end
        return result if dictionary.words.count {|w| result.include? w } > 50
      end
    end
  end
end

puts decrypt