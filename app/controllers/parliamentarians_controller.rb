class ParliamentariansController < ApplicationController
  def index
    @parliamentarians = Parliamentarian.all
  end

  def show
    @parliamentarian = Parliamentarian.find(params[:id])
    @expense = @parliamentarian.expenses
  end
end
