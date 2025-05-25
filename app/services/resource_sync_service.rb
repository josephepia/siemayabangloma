# require_relative 'config/environment'

def traducir_a_espanol(texto)
  traducido = `trans -b :es "#{texto}"`.strip
  traducido.empty? ? texto : traducido
end
class ResourceSyncService

    def self.sync!

      

      # tables = ActiveRecord::Base.connection.tables.reject { |t| t.start_with?("ar_internal", "schema_") || t == "resources" }
      tables = ActiveRecord::Base.connection.tables.reject { |t| t.start_with?("ar_internal", "schema_")}

      tables.each do |table|
        Resource.find_or_create_by(entity_type: table) do |resource|
          humanized = table.humanize
          traduccion = traducir_a_espanol(humanized)
          # puts table.ljust(30) + "=> #{traduccion}"
          resource.name = traduccion
          # puts "Resource name: #{resource.name}"
          # resource.name = table.humanize
          # puts "table name #{table.humanize}"
          resource.is_visible = false
        end
      end
  
      # Clean up resources for deleted tables, only if they were hidden
      Resource.where.not(entity_type: tables).where(is_visible: false).destroy_all
    end
  end