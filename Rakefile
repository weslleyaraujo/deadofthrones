task :start do
  system "bundle exec thin start"
end

task :install do
  system "bundle"
  system "npm install"
  system "bower install"
end

task :develop do
  system "compass:dev"
  system "bundle exec rerun thin start"
end

task :assets do
  system "grunt develop"
end
