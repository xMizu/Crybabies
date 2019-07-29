class ComplaintsController < ApplicationController

  # def new
  #  form created in the Round show page
  # end

  # def create
  #   #TODO created in round page
  # end

  def index
    @complaints = Complaint.all
  end
end
