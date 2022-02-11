# Hogwarts Again

# Lisa's Reflections:
I'm at the point in my understanding of this material, that I can do the work, but I still cannot fully explain the why and how of what's going on under the hood. I am understanding the role of the model, views and controller. In this IC I tried to keep all logic out of the views --- you'll see a new method in the professor and student models (prof_count and student_avg_age) to perform actions that I didn't feel should be included in the controller or view code. The many-to-many relationship was my biggest struggle --- if I recall it was a plural issue that gave me the most hangups... It's a lot of dominoes to set up just right. It was also tricky to figure out what migrations were already set up and what all I needed to really add in. `Questions` - did I handle user story 3 and 4 correctly - i.e. did I utilize ActiveRecord as I should have? Also --- did I handle the extension okay? This prompt was pretty straight forward, so it made sense to me to just modify the index method. I could see that this may also need to live in the model?

## Setup instructions:
  - Fork this repo
  - `git clone <repo>`
  - `cd <repo_name>`
  - `bundle install`
  - `rails db:{create,migrate,seed}`

When you run rspec, you should have 12 failing tests to start.  

###  Overview

We will be creating an application to track Professors and Students at the Hogwarts School of Witchcraft and Wizardry from the Harry Potter book series (you do not need any knowledge of Harry Potter to complete this challenge).


### User Stories

```
User Story 1 of 4
As a visitor,
When I visit '/professors',
I see a list of professors with the following information:
-Name
-Age
-Specialty
(e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")
```
```
User Story 2 of 4
As a visitor,
When I visit '/professors/:id'
I see a list of the names of the students the professors have.
(e.g. "Neville Longbottom"
     "Hermione Granger"
     "Luna Lovegood")
```
```
User Story 3 of 4
As a visitor,
When I visit '/students'
I see a list of students and the number of professors each student has.
(e.g. "Draco Malfoy: 5"
     "Nymphadora Tonks: 10")
```
```
User Story 4 of 4
As a visitor,
When I visit '/professors/:id'
I see the average age of all students for that professor.
(e.g. "Average Age: 14.5")
```
---
### Extension
```
User Story Extension
On all index pages, all information is listed alphabetically.
