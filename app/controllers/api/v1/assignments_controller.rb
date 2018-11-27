class Api::V1::AssignmentsController < Api::V1::BaseController
  before_action :set_assignment, only: :show

  def show
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
end
