# User Evidence Full Stack Engineer Test

## John Randall
* http://linkedin.com/in/johnrandall
* john@johnrandall.com


## Billy's Challenge:

[ ] Create a survey that has many questions, each question can have many responses.

[ ] Seed the database with some surveys, questions and responses.

[ ] Create the following ‘admin’ pages, following the layout as closely as possible: https://www.figma.
com/file/dWHgGLiC2tXuuWVkIGmtSd/UserEvidence-Takehome-Wireframes?node-id=0%3A1

[ ] Create the backend using Ruby on Rails and any gems of your choosing.

[ ] Create the frontend using Vue, React or Angular. CSS should be coded by hand.

[ ] Database queries should be as performant as possible.

[ ] This should take less than 2 hours of your time, please do not spend any more than that.

[ ] Deliver the project in a github repo.




## Domain questions / rough edges / would be PR comments in the real world:
* Punting for now: Should Question exist independently of Survey? Should the question/survey relationship be a many-to-many? For now, each question belongs to a single survey. If we want to build a reusable questions in the future, we should revisit this. At that time, it may be cleaner to just create a "clone survey" or "copy question to another survey" feature rather than complicating the relationships. 

* TBDiscussed: We should probably create a separate model for Respondent, rather than shoving the #name and #email fields into Answer. Keeping it simple for now. May want to revisit this before merging this PR. 
