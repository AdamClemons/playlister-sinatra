require 'rack-flash'

class SongsController < ApplicationController

    use Rack::Flash

    get '/songs' do
        # binding.pry
        @songs = Song.all
        erb :'/songs/index'
    end
    
    get '/songs/new' do
        @genres = Genre.all
        erb :'/songs/new'
    end

    post '/songs' do
        @song = Song.create(params[:song])
        @artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
        
        
        
        # binding.pry
        # if Artist.find_by(name: params[:artist_name])
        #     @artist = Artist.find_by(name: params[:artist_name])
        # else
        #     @artist = Artist.create(name: params[:artist_name])
        # end
        #  @song = Song.create(name: params[:song_name])
        #  @artist.songs << @song

        #  params[:song][:genre_names].each do |genre|
        #      @song.genres << Genre.find_by(name: genre)
        #  end
         flash[:message] = "Successfully created song."
         redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        # binding.pry
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        
        
        
        # binding.pry
        @song = Song.find_by_slug(params[:slug])
        @song.name = params[:song_name]

        if Artist.find_by(name: params[:artist_name])
            @artist = Artist.find_by(name: params[:artist_name])
        else
            @artist = Artist.create(name: params[:artist_name])
        end
        @song.artist = @artist
        
        @song.genres.clear
        params[:genres].each do |genre|
            @song.genres << Genre.find_by(name: genre)
        end
        @song.save

        # binding.pry

        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end

end