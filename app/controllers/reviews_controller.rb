# frozen_string_literal: true

class ReviewsController < ApplicationController
  layout 'with_header'

  before_action :authenticate_user!, except: %i[index show]
  before_action :set_review, only: %i[show edit update destroy]

  # /reviews
  def index
    if params[:movie_id]
      if !Movie.exists?(params[:movie_id])
        redirect_to movies_path, alert: 'Movie not found'
      else
        reviews = Movie.find(params[:movie_id]).reviews
      end
    else
      reviews = Review.all
    end

    render 'index', locals: { reviews: reviews }
  end

  # /reviews/:id
  def show; end

  # /reviews/new
  def new
    if params[:movie_id]
      if !Movie.exists?(params[:movie_id])
        redirect_to movies_path, alert: 'Movie not found'
      else
        @review.movie_id = params[:movie_id]
      end
    end

    @review = Review.new
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    if !@review.user.movies.exists?(@review.movie.id)&& @review.save
      redirect_to @review
    else
      render 'new'
    end
  end

  # /reviews/:id/edit
  def edit
    if params[:movie_id]
      movie = Movie.find_by(id: params[:movie_id])

      if movie.nil?
        redirect_to movies_path, alert: 'Movie not found'
      else
        @review = movie.reviews.find_by(id: params[:id])
        redirect_to movie_reviews_path(movie), alert: 'Review not found' if @review.nil?
      end
    else
      @review = Review.find(params[:id])
    end
  end

  # PATCH /reviews/:id
  def update
    if @review.update(review_params)
      redirect_to @review
    else
      redirect_to edit_reviews_path(@review)
    end
  end

  # DELETE /reviews/:id
  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :movie_id, user_id: current_user.id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
