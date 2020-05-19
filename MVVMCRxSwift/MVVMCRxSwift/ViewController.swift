//
//  ViewController.swift
//  MVVMCRxSwift
//
//  Created by Antonio Silva on 16/05/20.
//  Copyright © 2020 Antonio Silva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private var viewModel: RestaurantsListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {
        let sb = UIStoryboard(name: "Main", bundle: .main)
        let vc = sb.instantiateInitialViewController() as! ViewController
        vc.viewModel = viewModel
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        navigationItem.title = viewModel.title
        
        // Do any additional setup after loading the view.
   
        viewModel.fetchRestaurantViewModels().observeOn(MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell")) {
            index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
    }


}

