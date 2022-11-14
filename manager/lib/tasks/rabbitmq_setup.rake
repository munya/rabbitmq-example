namespace :rabbitmq do
  desc "Setup routing"
  task :setup do
    require "bunny"
    
    connection = Bunny.new(host: ENV["RABBITMQ"] || 'localhost')
    connection.start
    channel = connection.create_channel
    channel.fanout("contractor.payment_requests")
    queue = channel.queue("dashboard.payment_requests", durable: true)
    queue.bind("contractor.payment_requests")
    connection.close
  end
end
