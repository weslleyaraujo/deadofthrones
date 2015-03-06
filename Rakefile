task :crawler do
  "MONGOID_ENV=development bundle exec ruby crawler/app.rb"
end

task :develop do
  system "grunt compass:dev"
  system "bundle exec rerun thin start"
end
