# Table Relationships

## Learning objectives

1. Describe the structure of a one-to-many and a many-to-many relationship.
2. Understand how one-to-many and many-to-many relationships are represented at a database level.
3. Create databases tables representing one-to-many and many-to-many relationships.

## Intro

A significant part of good relational database design is understanding how to divide data into related tables.  If you're designing a system for an online store, you're likely to need to retain information on both users and orders.  This information shouldn't be stored in the same table but it **is** related - information relating to an order is unlikely to be particularly useful if we have no way of knowing who placed it.  We can store these links by using table relationships.

There are three types of relationships which can exist between tables in a relational database - one-to-one, one-to-many, and many-to-many.  Looking at the latter two, we'll try to answer four useful questions.

a) What is the structure of the relationship?
b) How is the relationship represented in a database?
c) How is the relationship established using SQL?
d) How do we make use of the relationship to query data?

## One-to-many
#### What is the structure of the relationship?
A one-to-many relationship describes a situation in which one parent model *has many* children, while the child model can be said to *belong to* one parent.

More concretely, let's imagine we're designing a database system for a university which, for now, has two tables - one for lecturers, and one for courses.

LECTURER                          COURSE
-------------------               ----------------------------------
|id  |name        |               |id |title                       |
-------------------               ----------------------------------
|1   |Mr Chips    |               |1  |Underwater Basket Weaving   |
|2   |Professor X |               |2  |History of Toast            |
-------------------               |3  |Ghostbusting                |
                                  |4  |The Art of Walking          |
                                  ----------------------------------

Presumably it's the case that each lecturer is responsible for teaching more than one course - i.e. a lecturer
*has many* courses.

We can also assume that each course is taught by a particular lecturer - i.e. a course *belongs to* a particular lecturer.

#### How is the relationship represented in a database?
#### How is the relationship established using SQL?
#### How do we make use of the relationship to query data?

```
cd path/to/databases_1/
bundle install
createdb databases_1
createdb databases_1_test
```

## Run the code

```
cd path/to/databases_1/
ruby run.rb
```

## Run the tests

```
cd path/to/databases_1/
rspec
```

## Spelunking DataMapper code

* Have a look at [this class that uses DataMapper](./example_of_class_that_uses_datamapper.rb).

* Walk through the code token by token.  For each token, ask: **How does this relate to the other parts of the code or the table?**. As you go through the code, try to incorporate these ideas into your answers:
  * Class
  * Method
  * Object
  * Attribute
  * Property
  * Table
  * Row
  * Column
  * Header

* Here are some example questions to help tease out the relationships between the parts of the code and the table.
  * `Person`. This is the `Person` class.
  * `create`. This is a class method provided by `DataMapper::Resource`.  What does it do?
  * `name:` What does `name:` correspond to? What if we put `blah:` instead?
  * `timmy.print_name`. Where does `print_name` come from? The class or object?
  * `timmy.name`. Why can we `.name`? (Maybe ask about how and when the data gets from table to attribute to accessor.)
  * `timmy.save`.  Where does `save` come from? What does it do?
  * `property :id`. How does this relate to the table?
  * `0  | Isla`. Where is this represented in the code?

## Exercise

You have three classes that constitute a domain, with a mix of computed methods, properties and relations.

### Infer the domain (20 mins)

* Look at the code and figure out the domain of the program: the nouns and verbs of the system.

* Represent these nouns and verbs in a diagram, or another form that feels useful to you.

### Infer the database structure (20 mins)

* Diagram the underlying database structure of the classes.

* Ideally, your diagram will include:
  * Table names.
  * Column names.
  * Column datatypes.
  * An indication of which columns are the primary keys and which are the foreign keys.
  * The DataMapper relationships between the columns/tables.
  * The data relationships between the columns/tables (eg one to one).
