####TARGET
- test for ruby drb
- test for gem  

####build and install Gem
- $ gem build yanlinpu_server.gemspec
- $ gem install yanlinpu_server-0.0.1.ylp.gem

####irb testing
- $ require 'yanlinpu_server'
- $ u = Yanlinpu::User.new({name:'yanlinpu',age:25,email:'yanlinpu66@163.com'})
- $ u.myself
- $ Yanlinpu::User.sing