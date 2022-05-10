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




## Domain questions / rough edges / notes:

* FYI - I've tried to keep the repo sane, and my steps deliberate. I recommend stepping through the commits one step at a time.

* FYI - I started with boiler-plate derived from this evolving bash script I wrote. The first ~10 commits were machine generated. see https://gist.github.com/johntrandall/a33c7d4c880fcef2a6dc0258abec92fe 

* Punting for now: Should the question/survey relationship be a many-to-many? For now, each question belongs to a single survey. If we want to build question that is reusable in the future, we should revisit this. At that time, it may be cleaner to just create a "clone survey" or "copy question to another survey" feature rather than complicating the relationships and having the question-survey relationship be many-to-many. 

* Punting for now: We should consider creating a separate model for Respondent, rather than shoving the #name and #email fields into Answer. Keeping it simple for now.

* I deviated from the instructions by using HotWire (TurboLinks+Stimulus) rather than React/Angular/Vue. I used Bootstrap with Custom ScSS overrides for styling. 

* I originally used Bootstrap for the collapse interactivity, but eventually replaced it with Stimulus as bootstrap fell short when it came to addressing the the background color toggling functionality. Flipping to just StimulusJS, rather than trying to mix StimulusJS with BootstrapJS was a cleaner approach that avoided entangling the two libraries and creating undo complexity.  

* If I were to do this again, I would explore another DOM structure option beyond using a nested table. The nested tabling was quite painful for CSS purposes. Also, because the show/hide toggle feature encompassed the show/hide of two table rows, and because those two rows did not have a shared parent element that could be cleanly targeted for a Stimulus controller scope, I found myself fighting the Stimulus framework and was not able to leverage Stimulus in a clean way. I made it work with some conditionals in the stimulus controller that filter by IDs injected into the DOM, but it is far from an elegant solution. The nested table structure was probably a mistake.  

* The database queries were more performant before turbolinks was introduced. Now that I've parallelized the load using Turbolinks, the end result is theoretically faster for the user. However, it now consumes more resources because it runs multiple HTTP requests, each with a separate database query.
