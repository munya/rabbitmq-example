class Publisher
  def self.publish(ex, payload  = {})
    event = channel.fanout("manager.#{ex}")
    event.publish(payload.to_json)
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  def self.connection
    @connection ||= Bunny.new(host: ENV["RABBITMQ"] || 'localhost').tap do |connect|
      connect.start
    end
  end
end