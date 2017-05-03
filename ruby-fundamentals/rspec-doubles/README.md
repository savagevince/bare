# Class interaction and dependency injection with RSpec

## Learning Objectives
* Remember that dependency injection is a strategy to achieve dependency inversion
* Remember that dependency inversion is a SOLID principle that can help to decouple dependent objects
* Use doubles to test the messages being passed between objects, rather than implementation within an object

## Dependency Injection

Here are some guidelines:
*  [Dependency Inversion Principle](https://en.wikipedia.org/wiki/Dependency_inversion_principle) states that:
 _A. High-level modules should not depend on low-level modules. Both should depend on abstractions.
  B. Abstractions should not depend on details. Details should depend on abstractions._
* This means that where we have one class depending on another, we should create an abstraction via the interface.
* We can do this by injecting the dependency via arguments at either the initialization level, or at the instance method level.

## Implement code to solve the exercises (30 mins)

* Clone this repo, cd into the directory, and run `bundle`
* First solve the feature tests in `spec/features/request_queue_spec.rb`
* Then go on to solve the more challenge specs in `spec/features/authorization_features_spec.rb`
* Remember to write unit tests as you go along, using doubles rather than real dependent objects

## Plenary (10 mins)

We'll look at your solutions on the projector and find ways they could be made cleaner.
