require 'sneakers/tasks'

desc "Run sneakers tasks"
task amqp: :environment do
  PaymentRequestsWorker
  Rake::Task["sneakers:run"].invoke
end