def substrings word, dictionary
  w = word.downcase
  dictionary.reduce({}) do |result, d|
    (0...(w.length - d.length)).each do |i|
      result[d] = result.fetch(d, 0) + 1 if w[i, d.length] == d
    end
    result
  end
end
