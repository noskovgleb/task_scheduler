# README

### Project Setup Guide

#### Prerequisites
- Make sure you have Docker and Docker-compose installed on your system.

#### Installation Steps
1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Build the Docker images by running the following command:
   ```
   docker-compose build
   ```
4. After the images are built, create and migrate the database by running:
   ```
   docker-compose run web rails db:create
   docker-compose run web rails db:migrate
   ```
5. Finally, start the application by running:
   ```
   docker-compose up
   ```

#### Accessing the Application
- Once the above commands are executed, the application will be accessible at: [http://localhost:3000](http://localhost:3000).
- To log in to the application, use the following credentials for basic authentication:
  - Username: admin
  - Password: admin

#### Testing Email Functionality
- For testing email functionality, you can access the Mailcatcher application at: [http://0.0.0.0:1080](http://0.0.0.0:1080).
