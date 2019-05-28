require ('pg')

class Property
  attr_accessor :address, :value, :year_built, :build
  attr_reader :id

  def initialize(options)
    @address = options['address']
    @value = options['value'].to_i
    @year_built = options['year_built'].to_i
    @build = options['build']
    @id = options['id'].to_i if options['id']
  end

def save()
  db = PG.connect({dbname:'property_manager', host:'localhost'})
  sql = "INSERT INTO properties(
  address, value, year_built, build) VALUES($1, $2, $3, $4) RETURNING id"

  values = [@address, @value, @year_built, @build]

  db.prepare("save", sql)

  saved_order = db.exec_prepared("save", values)
  saved_order_hash = saved_order[0]
  @id = saved_order_hash['id'].to_i
  db.close()

end


def update()
db = PG.connect({dbname:'property_manager', host:'localhost'})
sql = "UPDATE properties SET(address, value, year_built, build) =($1, $2, $3, $4) WHERE id = $5"
values = [@address, @value, @year_built, @build, @id]

db.prepare("update", sql)
db.exec_prepared("update", values)
db.close()

end

def delete()
  db = PG.connect({dbname: 'property_manager', host: 'localhost'})
  sql = "DELETE FROM properties WHERE id = $1"
  values = [@id]
  db.prepare("delete_one", sql)
  db.exec_prepared("delete_one", values)
  db.close()
end

end
