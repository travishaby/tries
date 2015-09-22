require 'minitest/autorun'
require 'minitest/emoji'
require_relative 'trie'

class TrieTest < Minitest::Test

  def test_node_has_children
    node = Node.new

    assert_equal({}, node.children)
  end

  def test_it_has_a_root_node
    trie = Trie.new

    assert trie.root
    assert_equal Node, trie.root.class
  end

  def test_push_single_letter_word
    trie = Trie.new
    trie.push("a")

    assert_equal ["a"], trie.root.children.keys
  end

  def test_push_two_letter_word
    trie = Trie.new
    trie.push("ad")

    assert_equal ["a"], trie.root.children.keys
    assert_equal ["d"], trie.root.children["a"].children.keys
  end

  def test_push_large_word
    trie = Trie.new
    trie.push("hello")

    branch = trie.root.children["h"].children["e"].
      children["l"].children["l"].children.keys
    assert_equal ["o"], branch
  end

  def test_push_two_similar_words
    trie = Trie.new
    trie.push("cat")
    trie.push("cab")

    branches = trie.root.children["c"].
      children["a"].children.keys
    assert_equal ["t", "b"], branches
  end

  def test_push_three_larger_words
    trie = Trie.new
    trie.push("longest")
    trie.push("longs")
    trie.push("longitude")

    branches = trie.root.children["l"].children["o"].
      children["n"].children["g"].children.keys.sort
    assert_equal ["e", "i", "s"], branches
  end

  def test_suggest_words_for_start_of_word
    trie = Trie.new
    trie.push("longest")
    trie.push("longs")
    trie.push("longitude")

    suggestions = ["longest", "longs", "longitude"]
    assert_equal suggestions, trie.suggest("long")
  end

end
