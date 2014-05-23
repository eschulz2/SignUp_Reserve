class VisitorsController < ApplicationController
  # def index
  # 	@visitor = Visitor.new
  # end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Got it, #{@visitor.email}."
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:email)
  end	
end
