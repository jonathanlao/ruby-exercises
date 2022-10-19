
def substrings(word, substrings)
    lower_word = word.downcase
    hash = {}
    substrings.each {|string| hash[string] = lower_word.scan(string).length }
    hash.select {|key, value| value > 0}
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)