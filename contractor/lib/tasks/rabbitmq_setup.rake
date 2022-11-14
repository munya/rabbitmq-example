namespace :rabbitmq do
  desc "Setup routing"
  task :setup do
    require "bunny"
    
    connection = Bunny.new(host: ENV["RABBITMQ"] || 'localhost')
    connection.start
    channel = connection.create_channel
    channel.fanout("manager.payment_requests")
    queue = channel.queue("manager_updates.payment_requests", durable: true)
    queue.bind("manager.payment_requests")
    connection.close
  end
end
