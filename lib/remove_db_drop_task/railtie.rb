module RemoveDbDropTask
  class Railtie < ::Rails::Railtie
    rake_tasks { load 'tasks/remove_db_drop_task.rake' }
  end
end
