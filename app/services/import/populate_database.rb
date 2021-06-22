require 'csv'

module Import
    class PopulateDatabase
        attr_reader :file
         
        def initialize(file)
            @file = file
        end
    
        def self.populate(file)
            new(file).populate
        end

        def populate
            populate_database_from_csv
        end
    
        private
    
        def populate_database_from_csv
            true
        end
    end
end
