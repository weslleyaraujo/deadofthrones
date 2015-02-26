require 'mongo'

mongo_client = Mongo::MongoClient.new("localhost", 27017)
db = mongo_client.db("dead_of_thrones")
coll = db.collection("characters")

puts coll.find.to_a.sample
