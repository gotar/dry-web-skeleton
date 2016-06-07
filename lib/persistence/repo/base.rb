require "rom-repository"
require "blog/container"
require "blog/import"

Blog::Container.boot!(:rom)

module Persistence
  module Repo
    class Base < ROM::Repository::Root
      include Blog::Import.args["persistence.rom"]
    end
  end
end
