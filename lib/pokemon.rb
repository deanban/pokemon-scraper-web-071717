class Pokemon
	attr_accessor :id, :name, :db, :type

	def initialize(id: nil, name:, type:, db:)
		@id = id
		@name = name 
		@type = type
		@db = db
	end

	def self.save(name, type, database_connection)
		database_connection.execute("insert into pokemon(name, type) 
			values(?,?)", name, type)
	end

	def self.find(id, database_connection)
		pokemon_result = database_connection.execute("select * from pokemon where id = ?", id).first
		Pokemon.new(id: pokemon_result[0], name: pokemon_result[1], type: pokemon_result[2], db: @db)
	end

end
