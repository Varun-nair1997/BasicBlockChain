//
//  BlockChain.swift
//  BlockChainApp
//
//  Created by Varun Nair on 2/14/20.
//  Copyright © 2020 Varun Nair. All rights reserved.
//

import UIKit

class BlockChain
{
    var chain: Array = [Block]()
    
    func createInitialBlock(data: String)
    {
        let genesisBlock = Block()
        genesisBlock.hash = genesisBlock.hashCreate()
        genesisBlock.data = data
        genesisBlock.prev_hash = "0000"
        genesisBlock.index = 0
        chain.append(genesisBlock)
    }
    
    func createBlock(data: String)
    {
        let newBlock = Block()
        newBlock.hash = newBlock.hashCreate()
        newBlock.data = data
        newBlock.prev_hash = chain[chain.count-1].hash
        newBlock.index = chain.count
        chain.append(newBlock)
    }
}
