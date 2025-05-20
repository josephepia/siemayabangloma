class ResourceSyncService
    def self.sync!
      # tables = ActiveRecord::Base.connection.tables.reject { |t| t.start_with?("ar_internal", "schema_") || t == "resources" }
      tables = ActiveRecord::Base.connection.tables.reject { |t| t.start_with?("ar_internal", "schema_")}

      tables.each do |table|
        Resource.find_or_create_by(entity_type: table) do |resource|
          resource.name = table.humanize
          resource.is_visible = false
        end
      end
  
      # Clean up resources for deleted tables, only if they were hidden
      Resource.where.not(entity_type: tables).where(is_visible: false).destroy_all
    end
  end