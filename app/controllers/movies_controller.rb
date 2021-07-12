# frozen_string_literal: true

class MoviesController < ApplicationController
  layout 'with_header'

  before_action :authenticate_user!, except: %i[index highest_rated show]
  before_action :admin?, except: %i[index highest_rated show]
  before_action :set_movie, only: %i[show edit update destroy]

  # GET /movies
  def index
    @movies = Movie.all
  end

  # GET /movies/highest_rated
  def highest_rated
    @movies = Movie.highest_rated
    render 'index'
  end

  # GET /movies/:id
  def show
    @review = Review.new
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @movie.reviews.build()
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    current_user.reviews << @movie.reviews

    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end
  end


  # GET /movies/:id/edit
  def edit; end

  # PATCH /movies/:id
  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      redirect_to edit_movies_path(@movie)
    end
  end

  # DELETE /movies/:id
  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :poster, :synopsis, :release_year, reviews_attributes: [:id, :title, :rating, :content, user_id: current_user.id])
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def admin?
    redirect_to movies_path unless current_user.admin?
  end
end
