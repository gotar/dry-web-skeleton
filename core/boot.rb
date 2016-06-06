require "bundler/setup"

require_relative 'blog/container'

Blog::Container.finalize!

require_relative 'blog/web/application'
