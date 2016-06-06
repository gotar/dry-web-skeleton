module TestHelpers
  module_function

  def container
    Blog::Container
  end

  def app
    Blog::Application.app
  end

  def rom
    container["persistence.rom"]
  end

  def db_connection
    rom.gateways[:default].connection
  end
end

