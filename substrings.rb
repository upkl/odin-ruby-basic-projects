# frozen_string_literal: true

def substrings(word, dictionary)
  w = word.downcase
  dictionary.each_with_object({}) do |d, result|
    (0...(w.length - d.length)).each do |i|
      result[d] = result.fetch(d, 0) + 1 if w[i, d.length] == d
    end
  end
end
