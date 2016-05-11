# -*- coding: utf-8 -*-
"""
Created on Wed May 11 17:36:09 2016

@author: jamin
"""

from apscheduler.schedulers.blocking import BlockingScheduler
from apscheduler.schedulers.background import BackgroundScheduler
import os

def docker_job():
    print 'hello world'

def docker_job_run():
    os.system('docker run --name="test1" hello-world')
    print 'docker add'
    
def docker_job_rm():
    os.system('docker rm "test1"')
    print 'docker del'

mm = 50
ss = 55

sched = BlockingScheduler()
#sched = BackgroundScheduler()
sched.add_job(docker_job_run,'cron', hour=22, minute=int(mm),second=int(ss), start_date='2016-05-11')
#sched.add_job(docker_job_add, 'interval', seconds=5)
sched.add_job(docker_job_rm,'cron', hour=22, minute=int(mm)+1,second=int(ss),start_date='2016-05-11')
sched.start()

print('aabbcc')