//
//  RestaurantsListViewModel.swift
//  MVVMCRxSwift
//
//  Created by Antonio Silva on 17/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import Foundation
import RxSwift

final class RestaurantsListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurants().map { $0.map { RestaurantViewModel(restaurant: $0)
            }
        }
    }
}
