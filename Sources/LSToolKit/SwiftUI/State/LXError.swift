//
//  LXError.swift
//  
//
//  Created by minghui on 2022/7/9.
//

import Foundation

public struct LXError : Error, Codable {
    public let code : Int
    public let message : String
}
