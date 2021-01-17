# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_movie, only: %i[show edit update destroy]

  # /movies
  def index
    @movies = Movie.all
  end

  # /movies/:id
  def show; end

  # /movies/new
  def new
    @movie = Movie.new
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to @movie
    else
      render 'new'
    end
  end

  # /movies/:id/edit
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
    params.require(:movie).permit(:title, :poster, :synopsis, :release_year)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
