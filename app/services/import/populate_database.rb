require 'csv'

module Import
    class PopulateDatabase
        attr_reader :csv
         
        def initialize(csv)
            @csv = csv
        end
    
        def self.populate(csv)
            new(csv).populate
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
