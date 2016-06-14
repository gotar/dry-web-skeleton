require "yaml"
require_relative "./types"

module Blog
  class Config < Dry::Types::Struct

    attribute :database_url, Types::Strict::String

    def self.load(root, name, env)
      path = root.join("config").join("#{name}.yml")
      yaml = File.exist?(path) ? YAML.load_file(path) : {}

      config = schema.keys.inject({}) { |memo, key|
        value = ENV.fetch(
          key.to_s.upcase,
          yaml.fetch(env.to_s, {})[key.to_s]
        )

        memo[key] = value
        memo
      }

      new(config)
    end
  end
end
