require "rom-repository"
require "blog/container"
require "blog/import"

Blog::Container.boot!(:rom)

module Persistence
  module Repo
    class Base < ROM::Repository
      def self.inherited(base)
        base.class_eval do
          include Blog::ArgsImport["persistence.rom"]

          def self.root
            self.to_s.downcase.split('::').last.to_sym
          end
        end
      end
    end
  end
end
