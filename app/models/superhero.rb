class Superhero

  attr_reader :first_name, :last_name, :id, :ability, :gender, :occupation, :city, :publisher, :name 

  def initialize(hash)
    @id = hash["id"]    	
    @name = hash["name"]  
    @ability = hash["ability"]    	
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @gender = hash["gender"]    
    @occupation = hash["occupation"]
    @city = hash["city"]
    @publisher = hash["publisher"]    
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  def self.find(id)
  	superhero_hash = Unirest.get("#{ENV['API_BASE_URL']}/superheros/#{id}.json").body
  	return Superhero.new(superhero_hash)
  end 
end
  # def first_name
  #   return @first_name
  # end

  # def last_name
  #   return @last_name
  # end

  # def email
  #   return @email
  # end

# end