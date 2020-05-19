//
//  RestaurantService.swift
//  MVVMCRxSwift
//
//  Created by Antonio Silva on 16/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

class RestaurantService: RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { observer -> Disposable in
 
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create {} // return empty disposable
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)  // send to the subscriber
            } catch {
                observer.onError(error)
            }
            return Disposables.create { }
        }
    }
}
