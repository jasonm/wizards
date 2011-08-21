require 'net/http'
require 'json'

# To publish from outside of an `EM.run {}` loop:
# http://groups.google.com/group/faye-users/browse_thread/thread/ae6e2a1cc37b3b07
class SyncFaye
  def initialize(address)
    @uri = URI.parse(address)
  end

  def send(channel, data)
    msg = JSON.dump('channel' => channel, 'data' => data)
    puts("SyncFaye delivering message to #{@uri}:\n#{msg}\n")
    Net::HTTP.post_form(@uri, :message => msg) 
  end
end
