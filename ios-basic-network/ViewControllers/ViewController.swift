//
//  ViewController.swift
//  ios-basic-network
//
//  Created by Tristan Richard on 05/04/2019.
//  Copyright © 2019 Tristan Richard. All rights reserved.
//

import UIKit
import RxAlamofire
import Alamofire
import RxSwift
import SDWebImage
import SwiftyJSON

class ViewController: UITableViewController {
    
    let bag = DisposeBag()
    var response = GuideApiResponse()
    let placeHolderImage = UIImage.emptyImage(with: CGSize(width: 50, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GuideAPI.getGuides()
            .subscribe(onNext: { [weak self] (dictionary) in
                
                let json = JSON(dictionary)
                
                self?.response = GuideApiResponse(json: json)
                self?.title = self!.response.total
                self?.tableView.reloadData()

                }, onError: { (error) in
            // Show error to user
        })
        .disposed(by: self.bag)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.response.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.response.data[indexPath.row]
        
        let identifier = "reusableCell"
        
        var cell: UITableViewCell
        
        if let reused = tableView.dequeueReusableCell(withIdentifier: identifier) {
            cell = reused
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
            cell.imageView?.sd_setShowActivityIndicatorView(true)
            cell.imageView?.sd_setIndicatorStyle(.gray)
            cell.imageView?.contentMode = .scaleAspectFit
        }
        
        cell.imageView?.sd_cancelCurrentImageLoad()
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.endDate
        
        cell.imageView?.sd_setImage(with: URL(string: item.icon), placeholderImage: self.placeHolderImage, options: .highPriority)
        
        
        return cell
    }

}

