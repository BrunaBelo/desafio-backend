class ParliamentariansController < ApplicationController
  def index
    @parliamentarians = Parliamentarian.all
    @parliamentarians = @parliamentarians.paginate(page: params[:page], per_page: 10)
  end

  def show
    @parliamentarian = Parliamentarian.find(params[:id])
    @expense = @parliamentarian.expenses
  end
end
