class ImportController < ApplicationController
  def import_csv
    error = Import::PopulateDatabase.populate(params[:file])
    if(error.blank?)
      redirect_to parliamentarians_path, flash: { success: 'Arquivo importado com sucesso!' }
    else
      redirect_to root_path, flash: { error: error }
    end
  end
end
