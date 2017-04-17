class VisitorsController < ApplicationController
  def index
@medicines = Medicine.all

      @search = Medicine.search(params[:q])
      @medicines = @search.result

  end

end
