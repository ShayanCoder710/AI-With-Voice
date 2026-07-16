#!/usr/bin/env xonsh

from openai import OpenAI
from colorama import Fore, Style

api = "API"

client = OpenAI(
    api_key = api,
    base_url = "https://api.gapgpt.app/v1"
)

clear

while True:
    i = input(f"{Fore.CYAN}You {Fore.YELLOW}➤ {Style.RESET_ALL}")

    if i == "exit":
        print(f"{Fore.RED}Bye{Style.RESET_ALL}")
        break

    if i == "clear":
        clear
        continue

    pkill espeak-ng

    response = client.chat.completions.create(
        model = "gapgpt-qwen-3.5",
        messages = [
            {"role": "system", "content": "فقط به انگلیسی جواب بده و اصلا از حروف الفبای فارسی استفاده نکن. دوستانه حرف بزن و سعی کن زیاد توضیح ندی و کم حرف بزنی. اسمت شایان هست و تو یک هوش مصنوعی کوچک هستی که قابلیت ویس هم داره."},
            {"role": "user", "content": i}
        ]
    )

    at = response.choices[0].message.content

    print(f"{Fore.MAGENTA}AI {Fore.YELLOW}➤ {Fore.CYAN}{at}{Style.RESET_ALL}")

    espeak-ng @(at) &
