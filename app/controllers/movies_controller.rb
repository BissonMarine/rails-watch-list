class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    # fonctionne
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie, notice: "You movie was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "You movie was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # fonctionne
    @movie.destroy
    redirect_to movies_url, notice: "You movie was successfully destroyed."
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def list_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
