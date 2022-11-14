Sneakers.configure(connection: Bunny.new(host: ENV["RABBITMQ"] || 'localhost'))
Sneakers.logger.level = Logger::INFO