require 'net/http'
require 'json'

module FayeModelSync
  module Observer
    def after_update(model)
      Event.new(faye_address, model, :update).broadcast
    end

    def after_create(model)
      Event.new(faye_address, model, :create).broadcast
    end

    def after_destroy(model)
      Event.new(faye_address, model, :destroy).broadcast
    end

    private

    def faye_address
      "#{FAYE_SERVER}/faye"
    end
  end

  class Event
    def initialize(faye_address, model, event)
      @faye_address = faye_address
      @model = model
      @event = event
    end

    def broadcast
      Message.new(@faye_address, channel, data).send
    end

    private

    def channel
      "/sync/#{@model.class.table_name}"
    end

    def data
      { @event => { @model.id => @model.as_json } }
    end
  end


  # To publish from outside of an `EM.run {}` loop:
  # http://groups.google.com/group/faye-users/browse_thread/thread/ae6e2a1cc37b3b07
  class Message
    def initialize(address, channel, data)
      @address = address
      @channel = channel
      @data = data
    end

    def send
      Net::HTTP.post_form(uri, :message => payload) 
    end

    private

    def uri
      URI.parse(@address)
    end

    def payload
      {:channel => @channel, :data => @data}.to_json
    end
  end
end
