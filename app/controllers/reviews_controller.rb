# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  # /reviews
  def index
    reviews = Review.all
    render 'index', locals: { reviews: reviews }
  end

  # /reviews/:id
  def show; end

  # /reviews/new
  def new
    @review = Review.new
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to @review
    else
      render 'new'
    end
  end

  # /reviews/:id/edit
  def edit; end

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
    params.require(:review).permit(:title, :content, :rating, :movie_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
