//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController {
    
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    
    
    // –––––– TODO: Initialize restaurantsArray
    
    
    
    // ––––– TODO: Add tableView datasource + delegate
    @IBOutlet weak var tableView: UITableViewCell!
    var restaurantsArray: [[String: Any?]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getAPIData()
        

    }
    func getAPIData() {
        API.getRestaurants() (completion: (restaurants) in guard let restaurants = restaurants else {
            return
        }
        print(restaurants)
        self.restaurantsArray = restaurants
        self.tabelView.reloadData()
    }
    func tableView(_ tableView UITableView, numberOfRowsInSection selection: Int) -> Int {
        return restaurantsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as!
                RestaurantCellTableViewCell
            let restaurant = restaurantsArray[indexPath.row]
            
            cell.label.text = restaurant["name"] as? String ?? ""
            if let imageUrlString = restaurant["image_url"] as? String {
                let imageUrl = URL(string: imageUrlString)
                cell.restaurantImage.af.setImage(withURL: imageUrl!)
            }
            
            return cell
    }
    
    
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    

}

// ––––– TODO: Create tableView Extension and TableView Functionality


