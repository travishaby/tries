class Trie
  attr_reader :root

  def initialize
    @root = Node.new
  end

  def push(word)
    letters = word.chars
    root.push(letters)
  end
end

class Node
  attr_reader :children

  def initialize
    @children = {}
  end

  def push(letters)
    letter = letters.shift
    children[letter] = Node.new if !children[letter]
    children[letter].push(letters) if !letters.empty?
  end
end
