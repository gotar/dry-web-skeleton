require "rom"

Blog::Container.boot! :config

Blog::Container.namespace "persistence" do |container|
  config = ROM::Configuration.new(:sql, container["config"].database_url)

  container.finalize(:rom) do
    config.auto_registration(container.root.join("lib/persistence"))
    container.register("rom", ROM.container(config))
  end
end
