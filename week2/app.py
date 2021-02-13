from flask import Flask, jsonify, request
# from flask_cors import CORS
from blockchain import Blockchain
from argparse import ArgumentParser

app = Flask(__name__)
# CORS(app)


@app.route('/', methods=['GET'])
def chian():
    chain = test.chain
    dictChain = [block.__dict__.copy() for block in chain]
    for dictBlock in dictChain:
        dictBlock['transactions'] = [tx.__dict__ for tx in dictBlock['transactions']]
    return jsonify(dictChain), 200


@app.route('/mine', methods=['POST'])
def mine():
    """ mine a block """
    pass

@app.route('/opentxs', methods=['GET'])
def opentxs():
    """ get the unconfirmed transactions or any transaction has not been included in a block """
    txs = test.unconfirmed
    if txs != None:
        dictTx = [tx.__dict__ for tx in txs]
        res = {
            'Transactions': dictTx
        }
        return jsonify(res), 200
    else:
        res = {
            'message': 'There is no transation'
        }
        return jsonify(res), 500
    pass
@app.route('/sendtx', methods=['POST'])
def sendtx():
    """ send a transaction"""
    values = request.get.json
    if not values:
        res = {
            'message': 'There is no input'
        }
        return jsonify(res), 400


    reqKeys = ['sender','receiver','amount']
    if not all(key in values for key in reqKeys):
        res = {
            'message': 'there is missing value'
        }
        return jsonify(res), 400
                    
    sender = values['sender']
    receiver = values['recevier']
    amount = values['amount']
    addTx = test.addTransaction(sender,receiver,amount)
    if addTx != None:
        res ={
            'transaction':{
                'sender' : values['sender'],
                'receiver' : values['recevier'],
                'amount' : values['amount']
            }
        }
        return jsonify(res), 200
    else:
        res = {
            'message': 'There is no transation'
        }
        return jsonify(res), 500
    pass
