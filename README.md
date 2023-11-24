## Requirements
Python +3.x

## Setup

```
python3 -m venv .venv
. .venv/bin/activate
pip3 install -r requirements.txt
```

## Run CSV downloader

Requirements:
- Query ID: ID of the query we want to fetch from Dune website
- API KEY: generated on Dune website


```
QUERY_ID=3228881 API_KEY=YOUR_API_KEY OUTPUT_FILE=GNO_holders_Ethereum.csv python3 csv_downloader.py
```

## Known IDs

- 3228599 GNO Holders on GnosisChain
- 3228881 GNO Holders on Ethereum
