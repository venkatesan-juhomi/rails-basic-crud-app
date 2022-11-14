class MoviesController < ApplicationController
  def index
    @movies = Movie.released
    # @movies = Movie.all_hit_movies
    # @movies = Movie.all_flop_movies
    # @movies = Movie.recently_added
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    movie_params = params.require(:movie).permit(:title, :rating, :total_gross, :description, :released_on, :director, :duration, :image_file_name)
  end

end
