#!/bin/bash
sleep 10 # Hack to give server time to connect
curl --location --request POST 'http://localhost:8000/start-mission'