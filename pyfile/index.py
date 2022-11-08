
# A lambda function to interact with AWS RDS MySQL

import pymysql
import sys
import boto3


aws_client = boto3.client('ssm')

response = aws_client.get_parameter(
    Name='rdshost'
)

host=response['Parameter']['Value']
splitedvalue =host.split(':')
address=splitedvalue[0]
print("hostaddress :", address)

REGION = 'us-east-1'

# DB_INSTANCE_ADDRESS="database-1.cfjpryfqfxre.us-east-1.rds.amazonaws.com"
rds_host  = address
print("mapped:",rds_host)
name = "root"
password = "Rootmysql57"
db_name = "Testdb"

def save_events(event):
    
    conn = pymysql.connect(rds_host, user=name, passwd=password, db=db_name, connect_timeout=5)
    
    
    with conn.cursor() as cur:
        cur.execute('''SET sql_notes = 0''')
        cur.execute("""create database IF NOT EXISTS sandbox""")
        cur.execute("""use sandbox""")
        cur.execute("""CREATE TABLE IF NOT EXISTS Persons (ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,Name varchar(255))""")
        
        for record in event['Records']:
            
            jsonmaybe = record['body']
            value=str(jsonmaybe)
            cur.execute("""insert into Persons(Name) values('%s')""" % (value))
            cur.execute("""select * from Persons""")
            conn.commit()
            cur.close()
            

def main(event, context):
    save_events(event)
        


# event = {
#   "id": 777,
#   "name": "appychip"
# }
# context = ""
# main(event, context)

