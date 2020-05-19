//
//  RestaurantViewModel.swift
//  MVVMCRxSwift
//
//  Created by Antonio Silva on 18/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import Foundation

struct RestaurantViewModel {
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
