import requests

url = "https://www.digikey.com/en/products/detail/yageo/RC0603FR-0747KL/727253"

response = requests.get(url)

if response.status_code == 200:
    content = response.text
    print(content)
else:
    print(f"Failed with : {response.status_code}")
