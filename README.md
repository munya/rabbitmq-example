# rabbitmq-example

Have to be run in two steps until resolve dependencies in containers
1. docker-compose up db redis rabbitmq contractor manager
2. docker-compose up contractor-worker manager-worker

Use for contractor
http://localhost:3000/payment_requests

Use for manager
http://localhost:3001/payment_requests
