## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them

 - Docker v18.09+
 - Git
 - Make

### Installing

A step by step series of examples that tell you how to get a development env running

Clone repository
```
$ git clone git@github.com:ivankomolin/docker-arduino-app-blank.git ./
```

Change enviroments file .env and install requirements
```
$ nano .env
$ make install
```

### Edit sketch

Sketch is located app/app.ino
Change sketch any editor and compile(not mandatory, use for checking code)

```
$ nano app/app.ino
$ make compile
```

### Upload sketch

Before upload running automatic compile
```
$ make upload
```

### Execute other command in arduino container

```
$ make exec cmd="arduino-cli lib install 'WiFi101'"
```