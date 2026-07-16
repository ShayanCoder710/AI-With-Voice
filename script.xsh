#!/usr/bin/env xonsh

from openai import OpenAI
import colorama

sudo apt install espeak-ng
pip install openai colorama --break-system-packages
clear

api = "API_KEY_GAPGPT"

client = OpenAI(
    api_key = api,
    base_url = "https://api.gapgpt.app/v1"
)

while True:
    i = input("You ➤ ")

    if i == "exit":
        print("Bye")
        break

    response = client.responses.create(
        model = "gapgpt-qwen-3.5",
        input = i
    )

    espeak-ng@(response.output_text)
    print(f"AI ➤ {response.output_text}")
