task :develop do
  system "grunt compass:all"
  system "bundle exec rerun thin start"
end

task :start do
  system "thin start"
end

namespace :db do
  task :fetch do
    system "MONGOID_ENV=development bundle exec ruby crawler.rb"
  end

  task :drop do
    system "rm -rf public/characters/*"
    system "mongo dead_of_thrones --eval \"db.characters.drop()\""
  end
end
