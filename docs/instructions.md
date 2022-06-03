# Welcome to Lightning Jet!

### This is a tool for working with the balance of your satoshis on LND 

**Lightning Jet is command-line only service; an SSH Key is required to use this service.**

## Setup 

> 1. SSH into this Embassy (add a new SSH Key if needed)
>
> 2. Run the following command to enter the `lightning-jet.embassy` container:
>
>    `docker exec -it lightning-jet.embassy /bin/bash`

**You should now be able to run Lightning Jet commands.**

## Telegram Bot

Lightning Jet telegram bot (Jet bot) will notify you about important events such as changes in fees for your remote peers.

To create Jet bot: initiate a conversation with BotFather on your Telegram app. Then, select the bot's name (e.g., JET bot) and bot's username (e.g., JET_bot).

Copy the telegram token from the Telegram app chat with BotFather (right under 'Use this token to access the HTTP API:'). Paste this token in the `Telegram API Token` field in your config window.

Start your Lightning Jet service, then open a chat with the bot you just created in your Telegram app and type /start. This will kick off the communication between the Telegram bot with Jet. You only need to do this step once.
## Run the command `jet help` for more information.
