class MoviesController < ApplicationController
    def index
        @movies = Movie.order(:title)
    end

    def show
        id = params[:id] # retrieve movie ID from URI route
        @movie = Movie.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
    end

    def new
        flash.now[:notice]= "Please fill out all field carefully."
        # default: render 'new' template
    end

    def create
        @movie = Movie.new(movie_params) # Use Strong Parameters aqui
        if @movie.save
            flash[:notice] = "#{@movie.title} was successfully created."
            redirect_to movies_path
        else
            render :new
        end
    end

    def edit
        @movie = Movie.find(params[:id]) # Buscar o filme pelo ID
    end

    def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
            if params[:star] && params[:star][:value]
                @movie.stars.create(value: params[:star][:value])
            end
            redirect_to @movie
        else
            render :edit
        end
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        flash[:notice] = "Movie '#{@movie.title}' deleted."
        redirect_to movies_path
    end

    private

    # Strong Parameters para permitir somente os campos necessários
    def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date, :image)
    end
end

