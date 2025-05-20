Rails.application.config.after_initialize do
    begin
      if ActiveRecord::Base.connection.table_exists?('resources')
        # ActiveRecord::Base.connection.column_exists?(:resources, :visible)
        ResourceSyncService.sync! if ActiveRecord::Base.connection.table_exists?('resources')
      end
      # ResourceSyncService.sync! if ActiveRecord::Base.connection.table_exists?('resources')
    rescue ActiveRecord::NoDatabaseError, PG::UndefinedTable
      # Silently skip if DB doesn't exist yet
    end
  end