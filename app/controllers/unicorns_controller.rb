class UnicornsController < ApplicationController
  def new
    @unicorn = Unicorn.new
  end

  def create
    @unicorn = Unicorn.new(unicorn_params)
    if @unicorn.save
      redirect_to unicorn_path(@unicorn)
    else
      render :new
    end
  end

  def index
    if current_user.admin == true
      @unicorns = Unicorn.all
    else
      @unicorns = Unicorn.where(user: current_user)
    end
  end

  def show
    @unicorn = Unicorn.find(params[:id])
  end

  def edit
    @unicorn = Unicorn.find(params[:id])
  end

  def update
    @unicorn = Unicorn.find(params[:id])
    @unicorn.update(unicorn_params)
    @unicorn.save
    redirect_to unicorn_path(@unicorn)
  end

  def destroy
    @unicorn = Unicorn.find(params[:id])
    @unicorn.destroy
    redirect_to unicorns_path
  end

  private

  def unicorn_params
    params.require(:unicorn).permit(:name, :sex, :behaviour, :color, :user_id)
  end
end
