# Discord-Sidebar-Price-Bot
These Python scripts can run Discord bots that pull live data at intervals and display it on the sidebar of a Discord guild (i.e. server). 

- **Cryptocurrency price** data (in USD, BTC, and/or ETH) from Coingecko API

Cryptocurrency Price Bot

Cache the cryptocurrency ticker list from Coincegko by generating a crypto_cache.json file.

`python crypto_cache.py -v`


## Dockerfile 
The provided Dockerfile is configured to run a price bot with the ticker `AKT`
You must configure the [crypto_config.yaml](crypto_config.yaml) with your unique Discord bot key and (non-unique) Guild ID and insert your prefered ticker (AKT)

`"AKT":
    priceUnit:
        - USD
        - ETH
    decimalPlace:
        - 0
        - 2
    updateFreq: 120
    discordBotKey: <Unique Discord Bot Key>
    guildId: <Guild ID>`

If you would like to create a docker image with your preferred ticker simply change `AKT` to your ticker of choice within the Dockerfile 
```CMD [ "python", "./crypto_run.py", "-t", "`AKT`" ]```

## Write your own Dockerfile 

1. Point to Python 

`FROM python:3`

2. Point to files/scripts in the repository 

`ADD crypto_run.py /`

`ADD requirements.txt /`

`ADD crypto_config.yaml /`

`ADD crypto_cache.json /`

`ADD crypto_cache.py /`
 
3. Install dependencies 

`RUN pip install -r requirements.txt`

`RUN pip install discord`
 
4. Command Execute

`CMD [ "python", "./crypto_run.py", "-t", "AKT" ]`

Feel free to use whatever ticker you'd like (on coin gecko). 

Be sure to update the crypto_config.yaml.
