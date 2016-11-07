# https://github.com/GNOME/libgit2-glib/blob/master/examples/walk.c

PATH = File.expand_path(File.dirname(__FILE__))
require "#{PATH}/../lib/ggit.rb"

repo_path = "#{PATH}/ruby-gnome2/.git"
file = Gio::File.path(repo_path)
repo = Ggit::Repository.open(file)
revwalker = Ggit::RevisionWalker.new(repo)
revwalker.sort_mode = [:time, :topological]
head = repo.head
revwalker.push(head.target)
while oid = revwalker.next do
  commit = repo.lookup(oid, Ggit::Commit.gtype)
  author = commit.author
  puts author.name
  puts author.time.format("%c")
  break
  puts commit.subject
  puts commit.message
  commit_parents = commit.parents
  if commit_parents.size > 0
    parent_commit = commit_parents.get(0)
    commit_tree = commit.tree
    parent_tree = parent_commit.tree

    diff = Ggit::Diff.new(repo, :old_tree => parent_tree,
                          :new_tree => commit_tree, :options => nil)
  end
end

