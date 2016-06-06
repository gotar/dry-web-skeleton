require "rom"

Blog::Container.namespace "persistence" do |container|
  config = ROM::Configuration.new(:sql, 'postgres://localhost/blog_dev')

  container.finalize(:rom) do
    container.register("rom", ROM.container(config))
  end
end
