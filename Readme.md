---
Project Title: Date Night
Data Structure: Binary Search Trees
Author: Nikhil Shahi
Date: July 5, 2022
Test Framework: Minitest
Test Coverage: 100%
---

Overview
========

You are a junior developer at Netflix. You’re on a team that is developing a list of movies for Netflix users called “Suggested for You.” Each time movies are added to Netflix, an algorithm determines a score of how likely a given user is to enjoy that movie.

Scores are integers between 0 and 100
No two movies will get the same score
It is your job to take new movies that have been scored, and store them in a Binary Search Tree.

Binary Search Trees
-------------------

A binary search tree is a fundamental data structure useful for organizing large sets of data. It’s ideal whenever you need to retrieve and sort data quickly.

More on Wikipedia: http://en.wikipedia.org/wiki/Binary_search_tree

A binary tree is built from nodes. Each node has:

A) An element of data  
B) A link to the left. All nodes to the left have elements with a value less or lower than this node’s data element.  
C) A link to the right. All nodes to the right have elements with a value more or greater than this node’s data element.  


## Base Expectations


Build a binary search tree which can fulfill each of the interactions below.

Assume we’ve started with:

```ruby
tree = BinarySearchTree.new
```


### ```insert```

The ```insert``` method adds a new node with the passed-in data. Each node is comprised of a score and a movie title. It returns the depth of the new node in the tree.

```ruby
tree.insert(61, "Bill & Ted's Excellent Adventure")
# => 0
tree.insert(16, "Johnny English")
# => 1
tree.insert(92, "Sharknado 3")
# => 1
tree.insert(50, "Hannibal Buress: Animal Furnace")
# => 2
```

For all the later methods defined here, assume that we’ve run these four inserts.

### ```include?```

Verify/reject the presence of a score in the tree:

```ruby
tree.include?(16)
# => true
tree.include?(72)
# => false
```

### ```depth_of```

Reports the depth of the tree where a score appears. Return nil if the score does not exist:

```ruby
tree.depth_of(92)
# => 1
tree.depth_of(50)
# => 2
```

### ```max```

Which movie has the highest score in the list? What is it’s score?

```ruby
tree.max
# => {"Sharknado 3"=>92}
```

### ```min```

Which movie has the lowest score in the list? What is it’s score?

```ruby
tree.min
# => {"Johnny English"=>16}
```

### ```sort```

Return an array of all the movies and scores in sorted ascending order. Return them as an array of hashes. Note: you’re not using Ruby’s ```Array#sort```. You’re traversing the tree.

```ruby
tree.sort
# => [{"Johnny English"=>16},
#   {"Hannibal Buress: Animal Furnace"=>50},
#   {"Bill & Ted's Excellent Adventure"=>61},
#  {"Sharknado 3"=>92}]
```

### ```load```

Assuming we have a file named ```movies.txt``` with one score/movie pair per line:

```ruby
tree.sort
# movies.txt sample format:
34, Hannibal Buress: Comedy Camisado
63, Meet My Valentine
22, Experimenter
84, French Dirty
41, Love
10, I Love You Phillip Morris
```

```ruby
tree.load('movies.txt')
# => 99
```

Where the return value is the number of movies inserted into the tree. If a score is already present in the tree when ```load``` is called, ignore it.

Example file is provided in this repo (movies.txt)

## Extensions

### ```leaves```

A leaf is a node that has no left or right value. How many leaf nodes are on the tree?

```ruby
tree.leaves
# => 2
```

### ```height```

What is the height (aka the maximum depth) of the tree?

```ruby
tree.height
# => 4
```
