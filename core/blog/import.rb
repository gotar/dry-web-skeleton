require_relative 'container'

module Blog
  Import = Dry::AutoInject(Blog::Container)
  ArgsImport = Import.args

  def self.Import(*args)
    Import[*args]
  end
end
