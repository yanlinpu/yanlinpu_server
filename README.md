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

####序列化
- include DRb::DRbUndumped#不让序列化()
- 可序列化（需要将不可序列化的attr_accessor转化为方法 可优化）