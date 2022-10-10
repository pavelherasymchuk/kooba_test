# Local deployment

## Install docker and docker-compose
* Follow setup instructions here to install docker engine https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository (or open page related to your OS)
* Install docker-compose: https://docs.docker.com/compose/install/
* Post-installation steps for Linux: https://docs.docker.com/engine/install/linux-postinstall/ . After this step you should be able to manage Docker as a non-root user.
  Try `docker ps` - you should not see permission error.

## Setup a .env file in the root of your project and copy data from env.example running following command:
````
cp env.example .env
````

## You can start application using `docker-compose` command:
````
docker-compose up --build
````

## ExpressionEngine Admin Panel:
````
http://localhost:80/admin.php
Username: admin
Password: Qwerty12345
````
You need to update these credentials in a remote environment.

## ExpressionEngine homepage:
````
http://localhost:80/
````

## MySQL: You can use phpMyAdmin to manage DB:
````
http://localhost:8081/
DB name: expressionengine
username: test
password: password
````

### Realized functionality:
* Integrated the static HTML page with CMS EE 7.1.6
* Editors have the ability to create, update and delete shows and their data via the CMS.
* Fields `Start date` and `End date` are not marked as required to have an opportunity to
  add events without an announced date (for further development, it's possible to add conditions to the template.).
* Each of the sections show a maximum of 6 cards (for further development, it's also possible to add pagination).

* Events without an announced date show a 'Remind Me' button. Also, you can generate an ICS file via click on the button
  (for further development, it is also possible to implement automatic sending of a ICS file by mail or a request to add it to the calendar.).
* Each card linked to a dedicated event detail page (for further development, it is also possible to develop a front-end functionality for every dedicated page).
* Automatically generated WebP versions of images delivered through ```<picture>``` tag.
* 'View All Shows' button to go to the full listing page which shows all events.