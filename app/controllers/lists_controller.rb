class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def index
    # fonctionne
    @lists = List.all
  end

  def show
  end

  def new
    # fonctionne
    @list = List.new
  end

  def edit
  end

  def create
    # fonctionne
    @list = List.new(list_params)

    if @list.save
      redirect_to @lists, notice: "You list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: "You list was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # fonctionne
    @list.destroy
    redirect_to lists_url, notice: "You list was successfully destroyed."
  end

  def put_in_list
    created_list = []
    # @restaurants = Restaurant.includes(:reviews).where(reviews: { rating: 5 })
    @movies = Movie.includes(:bookmarks).where(bookmarks: true)
    created_list << @movies
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
