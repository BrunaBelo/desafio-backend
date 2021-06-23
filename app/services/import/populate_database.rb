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
            error = ''
            CSV.open(file.path, 'r:bom|UTF-8:utf-8', headers: true, col_sep: ';', skip_blanks: true) do |csv|
                csv.each do |row|
                    
                end
            rescue CSV::MalformedCSVError
                error = 'Arquivo CSV mal formatado! Verifique a formatação do arquivo e tente novamente.'
            end
            error
        end
    end
end
