# -*- coding: utf-8 -*-
"""
Created on Sat Jan  2 14:43:45 2016
   simple web demo
   ###### This is static demo #########
@author: jamin
"""

#!/usr/bin/env python
from flask import Flask, render_template, Response,request,session


app = Flask(__name__)
# 0. index
@app.route('/')
def index():
    session.clear()
    return render_template('index.html')


# 1. dataMangement
@app.route('/',methods=['POST','GET'])
def data():
    dataType = request.form.get('dataSelect')
    dataType = int(dataType)
    session['dataType'] = dataType                 
    return render_template('test.html',dataType = dataType)

# 2. sysInfoCheck
@app.route('/info',methods=['POST','GET'])
def seg():
    if 'dataType' in session:
        dataType = session['dataType']    
        dataType = int(dataType)

    return render_template('test.html',dataType = dataType, segFileName = fname)

# 3. dockerManagement
@app.route('/dockerMange',methods=['POST','GET'])
def dockManage():
    return render_template('test.html',dataType = dataType, segFileName = fname)
	
    

if __name__ == '__main__':
#    app.debug = True
#    app.run(host='127.0.01', port =8001, debug=True, threaded=True)
    app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'
    app.run(host='127.0.0.1',port=8888)
