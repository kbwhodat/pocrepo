import requests
import nxlog
from email.mime.text import MIMEText
import pprint
import smtplib
import socket

HOSTNAME = 'http://e7e2-73-43-61-54.ngrok.io/'

def write_data(event):
	nxlog.log_info("Recieved event...")

	for field in event.get_names():
        print(field)

    nxlog.log_info(event)