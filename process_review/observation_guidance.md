# Common Flails

When observing your pair, keep an eye out for the following common deviations from good process:

## TDD
**Bad**
- Not starting with the simplest possible test
- Not seeing the test fail as expected before writing code
- Not writing the simplest code to fix the test failure message
- Writing meaningless tests e.g. `responds_to`
- Not thinking about edge cases
- Testing state of a class, rather than behaviour of a function.

**Good**
- Writing a test and watching it fail before writing code
- Starting with the simplest useful test
- Only write code to fix the test fail message you can see
- Including edge cases
- Testing the behaviour of a function, not state of a class
- Refactoring verbose tests after the code is working
- Looking for an opportunity to refactor after getting to green

## Programming Fluently
**Bad**
- Sets up a complex project structure for a small application
- Copying and pasting code from old projects
- Copying and pasting code from examples on the web
- Long pauses without any action

**Good**
- Sets up a project with only the tools they require e.g. git and a test library for a small project
- Can setup a new project in their chosen language quickly, and knows where to look if they get stuck
- Refers to official documentation when stuck on how to use a tool or language
- Knows how to use their tools e.g. git, text editor, test suite
- Organises their coding environment e.g. using split screens to see code and tests.

## Debugging
**Bad**
- Did not read error messages
- Googling for unrelated things
- Avoids solving the problem e.g. skips the test, moves on to new functionality
- Doesn't take action, pauses for long periods and gets 'stuck'
- Making guesses

**Good**
- Reads error messages before taking action
- Googles terms related to the error they are seeing, and can quickly identify useful resources
- Perseveres to solve the issue, even if they are not immediately aware of the cause
- Follows a debugging process e.g. tightens the loop and gets visibility
- Has a range to debugging approaches they can deploy to resolve an issue
- Strives to build a model of the code they are working on e.g. diagramming or explaining what the code does

## Modelling
**Bad**
- Does not take any time to break the problem down
- Does not identify the user interface
- Focuses on designing the solution before coding
- Approaches the problem with a specific solution in mind

**Good**
- Takes time to break the problem down into smaller problems
- Has a clear picture of how the user will interact with the application
- Does just enough design upfront to start
- Does not think about adopting a specific approach until a pattern emerges in the code

## Refactoring
**Bad**
- Using names that are hard to understand
- Refactoring before a pattern has emerged
- Not refactoring at all
- Refactoring resulting in code that is difficult to understand
- Missing opportunities to make small changes to the code
- Favouring large-scale refactors over small improvements

**Good**
- Using names that clearly relate to the class/method's purpose
- Waiting until there is a pattern in the code before applying an abstraction
- Checking code regularly for opportunities to refactor
- Retaining and improving readability when refactoring
- Making small changes to improve the quality of the code

## Problem Solving
**Bad**
- Pausing for long periods without verbalising thought process
- Googling for solutions to the specific challenge
- Not breaking the problem down
- Trying random problem solving approaches
- Guessing possible solutions
- Not using other tools to understand the problem
- Diving into code too quickly

**Good**
- Tries to understand the problem by diagramming, or writing pseudo-code
- Verbalises their thought process when solving a problem
- Uses Google to supplement their problem solving approach e.g. looking up specific syntax
- Breaks the problem down into smaller problems
- Has a problem solving approach that they default to e.g. defining inputs and outputs, or drawing a user interaction diagram
- Waits until they know what to do before writing code
- Can change their approach when faced with a tricky problem e.g. switching from diagramming to writing pseudo-code
- Waits until they have a clear problem definition and good first test before writing code
