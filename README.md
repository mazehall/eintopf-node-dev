# nodejs for [Eintopf](https://github.com/mazehall/eintopf)

[Node.js®](https://nodejs.org) is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js' package ecosystem, npm, is the largest ecosystem of open source libraries in the world.

This is just a simple hello world example in nodejs with express. You can use this as a pattern for your own Eintopf projects. 


## What is Eintopf?

Eintopf is a pot with the mixture of the smart development tools Docker, Vagrant and VirtualBox. Made to ease the chore of the daily project works.


## Create your own nodejs app with Eintopf

Changes in the module configuration will be loaded by Eintopf after a while. To be sure just restart Eintopf.

### 1. Clone the sources

Go into your Eintopf configs folder (default: ~/.eintopf/configs) and clone the [github repository](https://github.com/organizations/mazehall/eintopf-node-dev).

    git clone https://github.com/mazehall/eintopf-node-dev my-node-app

### 2. Change the project definition

To properly use your Eintopf config you have to change the project id to a not used one. To do that you have to change the "name" properties in the package.json file of your new config:

    {
      "name": "my-node-app", # change this
      ...
      "eintopf": {
        "name": "My node app" # change this
      ...
      
Changing of the other entries is encouraged but optional.

### 3. Set your project directory
 
Change PROJECT_DIR in project.sh in order to use your own project folder.

    PROJECT_DIR="my-node-app"
    
The project will then be deployed in yourEintopfAppPath/my-node-app.


You are now ready to work on your new nodejs project.

### 4. Set your virtual host name

Change VIRTUAL_HOST in the compose.yml. You have to set this in order to get through the proxy.

    environment:
      - VIRTUAL_HOST=mynodeapp.dev

### Customize your build environment

- Customize docker-compose.yml to suit your project environment (optional)
- Customize your build steps (optional)
  - keep in mind that the build can be started in and outside of the box
  - use the callInbox helper function from project.env.sh
- Add Eintopf custom actions (optional)