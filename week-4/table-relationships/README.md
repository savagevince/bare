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

A one-to-many relationship describes a situation in which one parent model _**has many**_ children, while the child model can be said to _**belong to**_ one parent.

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
_**has many**_ courses.

We can also assume that each course is taught by a particular lecturer - i.e. a course _**belongs to**_ a particular lecturer.

#### How is the relationship represented in a database?

Representing a one-to-many relationship is straightforward - we add a column to the child model's table referencing the id of the parent model.

LECTURER                          COURSE
-------------------               -----------------------------------------------
|id  |name        |               |id |title                       |lecturer_id |
-------------------               ----------------------------------------------|
|1   |Mr Chips    |               |1  |Underwater Basket Weaving   |2           |
|2   |Professor X |               |2  |History of Toast            |1           |
-------------------               |3  |Ghostbusting                |1           |
                                  |4  |The Art of Walking          |2           |
                                  ----------------------------------------------|

We can now see that Mr Chips teaches courses on the History of Toast and Ghostbusting, while Professor X is responsible for Underwater Basket Weaving and The Art of Walking.

The data in this new column is referred to as a _**foreign key**_.

#### How is the relationship established using SQL?

```sql
CREATE TABLE course (id SERIAL PRIMARY KEY, title VARCHAR(60), lecturer_id integer REFERENCES customer(id))
```

#### How do we make use of the relationship to query data?

Lets imagine we want to retrieve a list of all courses taught by Professor X from our database.  We can see that his id is 2, so we can do the following:

```sql
SELECT * FROM course WHERE lecturer_id = 2;
```

This will return us a list of all rows from the course table where the value in the lecturer_id column is 2.

## Exercise 1

* Create a database with the name toy_db
* Create two tables - users, and posts
* Users should have an id, name, and a password
* Posts should have and id and content
* Your tables should reflect a one-to-many relationship where users can _**have many**_ posts

##Many to Many
#### What is the structure of the relationship?

A many-to-many relationship describes a relationship between two models where there is no parent/child hierarchy - both models can be associated with _**multiple instances of the other**_.

For example, let's imaging that we now want to add a third table to our university database, this time listing students.

LECTURER                          COURSE                                            STUDENTS
-------------------               -----------------------------------------------
|id  |name        |               |id |title                       |lecturer_id |
-------------------               ----------------------------------------------|
|1   |Mr Chips    |               |1  |Underwater Basket Weaving   |2           |
|2   |Professor X |               |2  |History of Toast            |1           |
-------------------               |3  |Ghostbusting                |1           |
                                  |4  |The Art of Walking          |2           |
                                  ----------------------------------------------|


#### How is the relationship represented in a database?
#### How is the relationship established using SQL?
#### How do we make use of the relationship to query data?

## Exercise 2

##Extension
