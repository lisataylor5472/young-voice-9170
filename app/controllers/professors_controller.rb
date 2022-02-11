class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all.order(name: :asc)
  end

  def show
    @professor = Professor.find(params[:id])
  end
end
