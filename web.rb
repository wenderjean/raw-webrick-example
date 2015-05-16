require 'webrick'

class Web
  include WEBrick

  def initialize(host = 'localhost', port = 3000)
    @host = host
    @port = port
    @server = HTTPServer.new(:Port => port, :DocumentRoot => Dir::pwd)
  end

  def start
    puts "Starting server: http://#{@host}:#{@port}"
    trap("INT") { @server.shutdown }
    @server.start
  end
end

web = Web.new
web.start
