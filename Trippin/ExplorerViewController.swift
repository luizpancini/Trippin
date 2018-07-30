//
//  FirstViewController.swift
//  Trippin
//
//  Created by Luiz Santos on 7/27/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//

import UIKit
import ChameleonFramework

class ExplorerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var citiesArray = Array<City>()
    let AlfredoChaves = City()
    
    
    @IBOutlet weak var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.separatorStyle = .none
        
        //Register CityTableViewCell.xib file here:
        //cityTableView.register(UINib(nibName: "ExplorerCell", bundle: nil), forCellReuseIdentifier: "CityCell")
        
        AlfredoChaves.mainPicture = "opener"
        AlfredoChaves.Name = "Alfredo"
        AlfredoChaves.quickDescription = "Melhores cachus"
        citiesArray.append(AlfredoChaves)
        print(AlfredoChaves)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExplorerCell", for: indexPath)
//        cell.cityName.text = citiesArray[indexPath.row].Name
//        cell.cityDescriptionLabel.text = citiesArray[indexPath.row].quickDescription
//        cell.cityPicture = UIImageView(image: UIImage(contentsOfFile: citiesArray[indexPath.row].mainPicture))
        cell.textLabel?.text = citiesArray[indexPath.row].Name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToCity", sender: citiesArray[indexPath.row].Name)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cvc = segue.destination as! CityViewController
        cvc.thisCity.Name = sender as! String
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Trippin`"
        navigationController?.navigationBar.barTintColor = UIColor.flatWhite()
    }
    

}


