require "remove_db_drop_task/version"

module RemoveDbDropTask
  class Error < StandardError; end
end

require "remove_db_drop_task/railtie" if defined?(::Rails::Railtie)
