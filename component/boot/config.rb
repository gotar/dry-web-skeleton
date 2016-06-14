Blog::Container.finalize(:config) do |container|
  require 'blog/config'
  container.register("config", Blog::Config.load(
    container.root,
    "application",
    container.config.env
  ))
end
