//
//  Block.swift
//  BlockChainApp
//
//  Created by Varun Nair on 2/14/20.
//  Copyright © 2020 Varun Nair. All rights reserved.
//

import UIKit

class Block
{
    var hash: String!
    var data: String!
    var prev_hash: String!
    var index: Int!
    
    func hashCreate()-> String
    {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}
