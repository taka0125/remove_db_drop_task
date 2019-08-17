raise if ActiveRecord::Base.protected_environments.empty?

namespace :remove_db_drop_task do
  desc 'check remove_db_drop_task status.'
  task :check do
    if ActiveRecord::Base.protected_environments.include?(ENV['RAILS_ENV'])
      puts 'Enabled'
    else
      puts 'Disabled'
    end
  end
end

if ActiveRecord::Base.protected_environments.include?(ENV['RAILS_ENV'])
  Rake::Task.tasks.each do |t|
    next unless %w(db:drop db:drop:all db:purge db:purge:all).include?(t.name)

    task_name = t.name
    t.clear
    t.add_description 'Disabled; Please see https://github.com/taka0125/remove_db_drop_task/README.md'
    t.actions << proc { raise "#{task_name} is disabled. Please see https://github.com/taka0125/remove_db_drop_task/README.md" }
  end
end
