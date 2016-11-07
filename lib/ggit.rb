# Copyright (C) 2016  Ruby-GNOME2 Project Team
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

require "gobject-introspection"
require "gio2"

base_dir = Pathname.new(__FILE__).dirname.dirname.expand_path

require "#{base_dir}/lib/ggit/loader"

module Ggit

  Gio.init if Gio.respond_to?(:init)
  loader = Loader.new(self)
  loader.load("Ggit")

  init
  class << self
    undef_method(:init)
  end
end
