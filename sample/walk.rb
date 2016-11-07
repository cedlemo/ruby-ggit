# https://github.com/GNOME/libgit2-glib/blob/master/examples/walk.c

PATH = File.expand_path(File.dirname(__FILE__))
require "#{PATH}/../lib/ggit.rb"

repo_path = "#{PATH}/ruby-gnome2/.git"
file = Gio::File.path(repo_path)
#begin
  Ggit::Repository.open(file)
#rescue => error
#  puts error.message
#end
#revwalker = Ggit::RevisionWalker.new(repo)

