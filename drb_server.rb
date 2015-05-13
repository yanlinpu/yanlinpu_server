#encoding: utf-8
require 'drb'
require 'drb/acl'
require 'yanlinpu_server'
require 'pathname'
require 'drb/timeridconv'
include GC

module MyDrbLogger
  def logger(content)
    log = Time.now.to_s
    log << content << "\n"
    log_file = File.join(File.dirname(__FILE__), 'server_call_log.log')
    File.open(log_file, 'a+') do |f|
      f << log
    end
  end
end

class TestServer
  include ::MyDrbLogger
  include DRb::DRbUndumped
  def remote_check
	'server ok'
  end
  def remote_user_sing(song)
    Yanlinpu::User.sing(song)
  end
  def remote_user_new(option)
    Yanlinpu::User.new(option)
  end
end

module DRb
  class DRbServer
    class InvokeMethod
      include ::MyDrbLogger
      alias :init_with_client_with_log :init_with_client

      def init_with_client
        init_with_client_with_log
        logger("drb call:#{@msg_id}, args: #{@argv.inspect}")
      end
    end
  end
end

server_port = 9000
begin
=begin
  include ::DrbGc
  #配置访问控制列表
  list = %w[
     deny all
     allow 127.0.0.1
     allow localhost
     allow 127.0.0.*
  ]

  acl = ACL.new list, ACL::DENY_ALLOW
  #安装访问控制列表
  DRb.install_acl(acl)
=end
  puts 'server start...'
  server = TestServer.new
  #server drb垃圾回收处理
  #第一TimerIdConv
  #第二https://github.com/ruby/ruby/blob/ruby_2_1/sample/drb/name.rb
  #第三创建一个队列，创建对象之后加入队列，由client通知垃圾回收
  DRb.install_id_conv(DRb::TimerIdConv.new(90))
  DRb.start_service "druby://:#{server_port}", server
  DRb.thread.join
    #DRb.stop_service
rescue DRb::DRbConnError => e
  puts "server DRbConnectionClosed #{$!}"
end
