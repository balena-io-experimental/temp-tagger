# Losant Application managed with balena

This project deploys a Losant Application using webhooks with balena. It runs on a Raspberry Pi or balenaFin and this example sends the temperature of the CPU every some seconds. 


## Introduction

This project shows how to connect multiple devices managed with balena to the Losant IoT platform. At Losant we are going to use an Application with a webhook to auto-provision all the devices automatically. Finally at Losant we will indentify the devices with the balena ID.

## Getting started

### Hardware

* Raspberry Pi 4 or [balenaFin](https://www.balena.io/fin/)
* SD card in case of the RPi 4

### Software

* A Losant account ([sign up here](https://accounts.losant.com/create-account?))
* A balenaCloud account ([sign up here](https://dashboard.balena-cloud.com/))
* [balenaEtcher](https://balena.io/etcher)

Once all of this is ready, you are able to deploy this repository following instructions below.

## Deploy the code

### Via [Balena Deploy](https://www.balena.io/docs/learn/deploy/deploy-with-balena-button/)

Running this project is as simple as deploying it to a balenaCloud application. You can do it in just one click by using the button below:

[![](https://www.balena.io/deploy.png)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/balena_io_playground/losant_temp_tagger)

Follow instructions, click Add a Device and flash an SD card with that OS image dowloaded from balenaCloud. Enjoy the magic 🌟Over-The-Air🌟!

#### Balena Device Variables

Once successfully registered, the devices will inherit the Device environment variables needed to send the data from the device to a Losant webhook every specified time (in seconds). To change the data for all the devices from your balena application follow the instructions below:

1. Go to balenaCloud dashboard and get into your Application.
2. Click "Environment Variables" button on the left menu and edit the variables there. 


Variable Name | Value | Description | Default
------------ | ------------- | ------------- | -------------
**`LOSANT_WEBHOOK`** | `STRING` | Losant Webhook generated under your Losant Application | (e.g. https://triggers.losant.com/webhooks/0jlassTvcMDBwT1hXY9ZumtOxbVjyBl4nr6ZgPWCaA1$)
**`SLEEPING_TIME`** | `STRING` | Time between messages sent | 120

At this moment your device should be up and running sending the CPU temperature to Losant IoT platform. Check that the temperature received matches with the temperature printed on the balenaCloud Logs.


## Configure the Losant Application

[WIP]


## Attribution

- This is an evolution of the [previous Losant and balena articles](https://www.balena.io/blog/getting-started-with-losant-and-resin/).
- This is in part working thanks of the work of Maria Lang from Losant and Marc Pous from balena.io.
- This is in part based on excellent work done by the Balena.io Hardware Hackers team.

