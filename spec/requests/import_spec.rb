require 'rails_helper'

RSpec.describe "Imports", type: :request do
  let(:path_to_file) { Rails.root.join 'spec/fixtures' }
  let(:file) { Rack::Test::UploadedFile.new "#{path_to_file}/file.csv", 'text/csv' }
  let(:file_with_error) { Rack::Test::UploadedFile.new "#{path_to_file}/file_with_error.csv", 'text/csv' }

  describe "POST /import_csv" do
    context 'when the datas is successfully imported' do
      it 'should return message success' do
        post import_csv_path, params: { file: file }
        expect(flash[:success]).to eq('Arquivo importado com sucesso!')
      end

      it 'should redirect to parliamentarians_path' do
        post import_csv_path, params: { file: file }
        expect(response).to redirect_to(parliamentarians_path)
      end
    end

    context 'when the file is not imported successfully' do
      it 'should return message error' do
        post import_csv_path, params: { file: file_with_error }
        expect(flash[:error]).to eq('Erro ao importar arquivo csv.')
      end

      it 'should redirect to root_path' do
        post import_csv_path, params: { file: file_with_error }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
