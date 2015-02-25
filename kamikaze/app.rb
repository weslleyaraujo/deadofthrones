require 'mongo'

connect = Mongo::Connection.new
db = connect.db('dead_of_thrones')
collection = db.collection('characters')
user = collection.find_one()

puts user