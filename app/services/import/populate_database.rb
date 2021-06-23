require 'csv'

module Import
    class PopulateDatabase
        STATE = 'PR'.freeze

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
            CSV.open(file.path, 'r:bom|utf-8', headers: true, col_sep: ';', skip_blanks: true) do |csv|
                csv.each do |row|
                    next if row['sgUF'] != STATE
                    ActiveRecord::Base.transaction do
                        create_entities(row)
                    end
                rescue Exception => exception_error
                    error = exception_error
                end
            rescue CSV::MalformedCSVError
                error = 'Arquivo CSV mal formatado! Verifique a formatação do arquivo e tente novamente.'
            end
            error
        end

        def create_entities(row)
            legislature = Legislature.find_or_create_by!(year: row['nuLegislatura'], legislature_code: row['codLegislatura'])
            parliamentarian = find_or_create_parliamentarian!(row, legislature)
            expense_type = ExpenseType.find_by(number: row['indTipoDocumento'])
            expense_type = ExpenseType.find_by(number: 3) if expense_type.nil?
            provider = Provider.find_or_create_by!(name: row['txtFornecedor'], number_person_id: row['txtCNPJCPF'])
            quota_type = QuotaType.find_or_create_by!(description: row['txtDescricao'], number: row['numSubCota'])
            create_quota_type_specification!(row, quota_type) if quota_type.quota_type_specification.blank?
            create_expense!(row, parliamentarian, provider, expense_type, quota_type)
        end

        def find_or_create_parliamentarian!(row, legislature)
            Parliamentarian.find_or_create_by!(
              name: row['txNomeParlamentar'],
              register_id: row['ideCadastro'],
              card_parliamentary: row['nuCarteiraParlamentar'],
              number_person_id: row['cpf'],
              federation_unity: row['sgUF'],
              political_party: row['sgPartido'],
              legislature_id: legislature.id
            )
        end

        def create_quota_type_specification!(row, quota_type)
            QuotaTypeSpecification.create!(
                description: row['txtDescricaoEspecificacao'],
                number: row['numEspecificacaoSubCota'],
                quota_type_id: quota_type.id
            )
        end

        def create_expense!(row, parliamentarian, provider, expense_type, quota_type)
            Expense.create!(
                document_number: row['txtNumero'],
                issue_date: row['datEmissao'],
                value: row['vlrDocumento'],
                gloss_value: row['vlrGlosa'],
                net_value: row['vlrLiquido'],
                month: row['numMes'],
                year: row['numAno'],
                installment_number: row['numParcela'],
                passenger: row['txtPassageiro'],
                travel_part: row['txtPassageiro'],
                lot_number: row['numLote'],
                refund: row['numRessarcimento'],
                restitution: row['vlrRestituicao'],
                id_documento: row['txtNumero'],
                document_url:  row['urlDocumento'],
                parliamentarian_id: parliamentarian.id,
                provider_id: provider.id,
                expense_type_id: expense_type.id,
                quota_type_id: quota_type.id
            )
        end
    end
end
