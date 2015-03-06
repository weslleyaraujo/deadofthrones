task :populate do
  system "MONGOID_ENV=development bundle exec ruby crawler.rb"
end

task :develop do
  system "grunt compass:dev"
  system "bundle exec rerun thin start"
end
