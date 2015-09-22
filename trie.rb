class Trie
  attr_reader :root

  def initialize
    @root = Node.new
  end

  def push(word)
    letters = word.chars
    root.push(letters)
  end

  def suggest(fragment)
    letters = fragment.chars
    root.suggest(letters)
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

  def suggest(letters)

  end

end
