class Api::V1::SuperherosController < ApplicationController

	def show
   		@superhero = Superhero.find(params[:id])
   	end
	# superhero_hash = Unirest.get("http://localhost:3000/superheros/#{params[:id]}.json").body
	# @superhero = Superhero.new(superhero_hash)
	# end 

  def index
    # GOAL: @superheros = superhero.all
    superheros_array = Unirest.get("http://localhost:3000/superheros.json").body["superheros"]
    @superheros = []
    superheros_array.each do |superhero_hash|
      @superheros << Superhero.new(superhero_hash)
      p "INDEX STUFF"
      p @superheros

    end
  end






	# def index
	# @superheros = Unirest.get("http://localhost:3000/superheros.json").body["superheros"]
	# end 

	def new

	end 

	def create
	@superhero = Unirest.post("http://localhost:3000/superheros.json", :headers => {"Accept" => "application/json"}, :parameters => {:name => params[:name], :ability => params[:ability], :first_name => params[:first_name], :last_name => params[:last_name], :gender => params[:gender], :occupation => params[:occupation], :city => params[:city], :publisher => params[:publisher]}).body

		redirect_to superhero_path(@superhero["id"])


	end
end
