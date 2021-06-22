class ImportController < ApplicationController
  def import_csv
    if(Import::PopulateDatabase.populate(params[:file]))
      redirect_to parliamentarians_path, flash: { success: 'Arquivo importado com sucesso!' }
    else
      redirect_to root_path, flash: { error: 'Erro ao importar arquivo csv.' }
    end
  end
end
