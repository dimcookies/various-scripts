#!/usr/bin/python
import urllib2
import ssl
import re
import os.path
import sys

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

for i in range(2, 20):
	ip = "192.168.1.%d" % i
	try:
		response = urllib2.urlopen('https://%s' % ip, timeout=1, context = ctx)
		html = response.read()
		match = re.search('<title>(.*?)</title>', html)
		title = match.group(1) if match else 'No title'
		if "IPCam Client" == title:
                        if len(sys.argv)>1:
                            print ip
                            break
			fname = 'foscam_ip'
			if os.path.isfile(fname):
				with open(fname,"r") as f:
					c_ip = f.readline().strip()
					if c_ip == ip:
						break
			with open(fname,"w") as f:
				f.write(ip)
				f.close()
			break
	except:
		pass		

		


