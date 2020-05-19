//
//  Restaurant.swift
//  MVVMCRxSwift
//
//  Created by Antonio Silva on 16/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import Foundation


struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}


enum Cuisine: String, Decodable {
    case brazilian, british, european, french
}
