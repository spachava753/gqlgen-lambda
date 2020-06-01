# gqlgen-lambda

This is a prototype project demonstrating that a performant, zero-cost Graphql layer is possible with AWS Lambda functions. 

The lambda function is uses Golang and [GqlGen](https://github.com/99designs/gqlgen). It uses [Gin](https://github.com/gin-gonic/gin) to serve the requests, and [aws-lambda-go-api-proxy](https://github.com/awslabs/aws-lambda-go-api-proxy) to proxy the request from API Gateway to Gin. The Graphql function is written in such a way that you can easily convert the code to a microservice with little to no effort.

# Pros
 - You get the ease of writing and deploying a lambda function. (Sam CLI, Serverless Framework, Apex Up, etc.)
 - Can easily convert the lambda function to a standalone service, and can convert existing services to lambda easily
 - Can easily test the endpoint with the playground endpoint offered by GqlGen
 - You can utilize the benefits of API Gateway, such as rate limiting, throttling, Authorization, etc.
 - Performant, since written in Golang
 - Tiny cold start time 
 - Most of all, since AWS has a generous free tier for Lambda, in most cases you should be able to have a Graphql endpoint for __free__
 
# Cons
 - No way to do subscriptions
 - and  ... that's it? 🤔

# Why not AppSync?
AppSync is great for bootstrapping and fast development and in most cases, AppSync would be enough. It has plenty of features like:

 - it integrates nicely with Amplify and can easily generate client code given an AppSync endpoint
 - provides plenty of sample templates for multiple data sources
 - provides authorization, such as integration with Cognito
 - multiple convenient scalar types
 - integration with X Ray
 - Graphql generation wizard

and lots more

However, it is difficult to some things, like:

 - debug AppSync resolvers
 - connect to data sources not supported by AppSync (must make HTTP calls)
 - do complex business logic
 - do unit tests
 - logging

AppSync also pretty much forces you to lock in from day one, and you can't really re-use any of the VTL templates. However, we can easily repurpose this project to a microservice. With AppSync, you don't get a full fledged language and all of its benefits, such as robust libraries, concurrency, etc. 
