Task Management System (CLI)

What is this?

This is a command-line Task Management System developed in Ruby. The application allows users to create and manage projects and the tasks associated with those projects. By using this app, user can assign multiple task to multiple projects and each task and project has a unique property / id due to whcih there is not any chance of duplication.
User can also apply filter on the task and also provides searching feature to the user that user can search the task.

What can it do?

This application provide the following feature:

Project Management

. Create a new project
. View all projects
. View details of a specific project
. Update project information
. Delete a project

Task Management

. Create tasks for an existing project
. View all tasks
. View task details
. Update task information
. Mark tasks as completed
. Delete tasks
. Search tasks by title or description
. Filter tasks by status or priority

Data Storing

. Data is store in the JSON file

How do I install it?

To install this application, you have to folow the following steps

First of all you have install ruby on your system
You have gem install on your system
Clone this project from the github
Install the GemFile and install the require gem

How do I run it?

From the project directory, run:
ruby app.rb
This will start the application and display the main menu.

How do I use it?

After starting the application, you'll see a menu with different options.

You can:

Create a new project.
Add tasks to a project.
View or update project and task details.
Mark tasks as completed.
Search for tasks using keywords.
Filter tasks by their status or priority.
Delete projects or tasks when they are no longer needed.

All changes are saved automatically in the JSON files.

How is the code organized?

The project is divided into different folders so that each part of the application has a specific responsibility.

task_manager/
│
├── app.rb
├── data/
├── model/
├── services/
├── views/
├── utils/
└── modules/

app.rb

Starts the application and displays the main menu.

models/

Contains the Project and Task classes. These classes represent the application's data.

services/

Contains the business logic, such as creating, updating, deleting, searching, and filtering projects and tasks.

views/

Handles user interaction through the command-line interface.

utils/

Contains reusable helper methods such as JSON file handling.

modules/

Contains the reuseable methood such as validations.

Where is data stored?

All data is stored inside the data folder.

data/
├── project.json
└── task.json

Projects are saved in project.json and tasks are saved in task.json. Because the data is stored in JSON files, it remains available even after the application is closed and reopened.

What design decisions were made?

While building this project, I made a few design decisions to keep the code clean and easy to maintain.

I separated the application into different layers (Views, Services, Models, Modules and Utilities) so that each file has a single responsibility.
I used JSON files instead of a database because this project is a command-line application.
IDs for both projects and tasks are generated automatically.
Every task must belong to an existing project.
Input validation is performed before saving any data.
Project progress is calculated dynamically based on the number of completed tasks.

What limitations exist?

This application have few limitations, which are as follow

It supports only one user.
There is no login or authentication system.
Deleted projects and tasks cannot be recovered.
The application only works in the terminal and does not have a graphical interface.
