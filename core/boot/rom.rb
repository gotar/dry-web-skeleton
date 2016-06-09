require "rom"

Blog::Container.namespace "persistence" do |container|
  config = ROM::Configuration.new(:sql, 'postgres://localhost/blog_dev')

  container.finalize(:rom) do
    config.auto_registration(container.root.join("lib/persistence"))
    container.register("rom", ROM.container(config))
  end
end
