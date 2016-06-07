require_relative 'container'

module Blog
  Import = Dry::AutoInject(Blog::Container)

  def self.Import(*args)
    Import[*args]
  end
end
