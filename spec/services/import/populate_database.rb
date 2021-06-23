require 'rails_helper'

RSpec.describe Import::PopulateDatabase, type: :service do
    context 'when import is successfully ' do
        before(:all) do
            file = Rack::Test::UploadedFile.new('spec/fixtures/file.csv')
            @result = Import::PopulateDatabase.populate(file)
        end

        it 'should return without errors' do
            expect(@result).to be_blank
        end

        it 'should only create PR parliamentarians' do
            expect(Parliamentarian.where.not(federation_unity: 'PR').empty?).to be(true)
        end

        it 'should create legislature 2019' do
            expect(Legislature.count).to be(1)
            expect(Legislature.first.year).to be(2019)
        end

        it 'should create provider' do
            expect(Provider.count).to be(4)
            expect(Provider.first.name).to eq('CONDOMÍNIO EDIFÍCIO COLOMBO')
        end

        it 'should create parliamentarian' do
            expect(Parliamentarian.count).to be(3)
            expect(Parliamentarian.first.name).to eq('Gustavo Fruet')
        end

        it 'should create quata type' do
            expect(QuotaType.count).to be(1)
            expect(QuotaType.first.description).to eq('MANUTENÇÃO DE ESCRITÓRIO DE APOIO À ATIVIDADE PARLAMENTAR')
        end

        it 'should create quata type specification' do
            expect(QuotaTypeSpecification.count).to be(1)
            expect(QuotaTypeSpecification.first.description).to eq('SUBCOTA ESPECIFICACAO')
        end

        it 'should create expenses' do
            expect(Expense.count).to be(4)
        end

        it 'should add expenses to parliamentarian' do
            expect(Parliamentarian.find_by(register_id: '73772').expenses.count).to be(2)
        end
    end

    describe 'when there is an error on the first line of the CSV' do
        before(:all) do
          Legislature.destroy_all
          ExpenseType.destroy_all
          QuotaType.destroy_all
          Provider.destroy_all
          file = Rack::Test::UploadedFile.new('spec/fixtures/file_with_error.csv')
          @result = Import::PopulateDatabase.populate(file)
        end
    
        it 'should return without errors' do
            expect(@result).not_to be_blank
        end

        it 'should not create datas' do
            expect(Legislature.count).to eq(0)
            expect(Parliamentarian.count).to eq(0)
            expect(QuotaType.count).to eq(0)
            expect(QuotaTypeSpecification.count).to eq(0)
            expect(Provider.count).to eq(0)
            expect(Expense.count).to eq(0)
        end
    end
end
