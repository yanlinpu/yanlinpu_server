####TARGET
- test for ruby drb
- test for gem  

####build and install Gem
- $ gem build yanlinpu_server.gemspec
- $ gem install yanlinpu_server-0.0.1.ylp.gem

####open the server
- $  nohup ruby drb_server.rb &

####see the log
- $ tail -f server_call_log.log