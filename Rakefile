# docker-opsweekly Rakefile to standardize commands

desc "Build the docker image"
task :build do
  sh "docker build -t decaf/opsweekly ."
end

desc "Run the docker image"
task :run do
  sh "docker run -e MYSQL_ROOT_PASSWORD=password -e OPSWEEKLY_MYSQL_PASSWORD=opsweekly -p 80:80 -it decaf/opsweekly"
end

desc "Debug the docker image by running but with a shell, not the default cmd"
task :debug do
  sh "docker run -e MYSQL_ROOT_PASSWORD=password -e OPSWEEKLY_MYSQL_PASSWORD=opsweekly -p 80:80 --entrypoint /bin/bash -it decaf/opsweekly"
end

task :default => [:build, :run]
