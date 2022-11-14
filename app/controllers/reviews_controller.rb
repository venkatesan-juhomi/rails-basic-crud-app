class ReviewsController < ApplicationController
  before_action :set_movie, only: [:index, :new, :create]
  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end
  
  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_reviews_path
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @review.update(review_params)
      redirect_to movie_reviews_path
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to movie_reviews_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_review
    @review = Review.find(params[:id])
    @movie = @review.movie
  end

  def review_params
    params.require(:review).permit(:name, :stars, :comment)
  end
  
end
