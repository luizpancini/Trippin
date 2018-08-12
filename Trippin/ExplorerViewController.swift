//
//  FirstViewController.swift
//  Trippin
//
//  Created by Luiz Santos on 7/27/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//

import UIKit
import ChameleonFramework
import Foundation

class ExplorerViewController: UITableViewController {
    
    var citiesArray : [City] = [City]()
    var filteredCitiesArray : [City] = [City]()
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet var cityTableView: UITableView!
    @IBOutlet weak var topLabel: UILabel!
    
//MARK: Loaded view methods
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        
        setupSearchBar()
        setupNavBar()
        setupTopLabel()
        citiesArray = loadCities()
        
    }
    
    //MARK: TableView Datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredCitiesArray.count
        }
           return citiesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExplorerCell", for: indexPath) as! CityTableViewCell
        let city: City
        if searchController.isActive && searchController.searchBar.text != "" {
            city = filteredCitiesArray[indexPath.row]
        } else {
            city = citiesArray[indexPath.row]
        }
        if let image = UIImage(named: city.mainPicture) {
                cell.nameLabel.text = city.Name
                cell.teaserLabel.text = city.quickDescription
                cell.mainPicture.image = image
            }
        return cell
    }
    
    //MARK: TableView Delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let city: City
        if searchController.isActive && searchController.searchBar.text != "" {
            city = filteredCitiesArray[indexPath.row]
        } else {
            city = citiesArray[indexPath.row]
        }
        performSegue(withIdentifier: "goToCity", sender: city)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cvc = segue.destination as! CityViewController
        cvc.thisCity = (sender as? City)!
    }
    
    //MARK: Navigation bar methods
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Trippin`"
        navigationController?.navigationBar.barTintColor = UIColor.flatWhite()
    }
    
    //MARK: UI methods
    
    func setupTopLabel() {
        topLabel.text = "Lugares que a gente ama"
        topLabel.textColor = UIColor.black
        topLabel.font = UIFont(name: "Helvetica-Bold", size: 30.0)
    }
    
    
    
    //MARK: Search bar methods
    func filterContent (searchText: String, scope: String = "All") {
        filteredCitiesArray = citiesArray.filter { city in
            return city.Name?.lowercased().range(of: searchText.lowercased()) != nil
        }
        tableView.reloadData()
    }
    
}

//MARK: SearchBar methods
extension ExplorerViewController: UISearchResultsUpdating {
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContent(searchText: searchController.searchBar.text!)
    }
    
}

//MARK: Cities data
extension ExplorerViewController {
    
    func loadCities() -> [City]{
        
        var newArray = [City]()
        
        let AlfredoChaves = City()
        AlfredoChaves.mainPicture = "alfredoChavesMainPic"
        AlfredoChaves.Name = "Alfredo Chaves"
        AlfredoChaves.quickDescription = "Aqui tem uma cachoeira melhor que a outra"
        
        let SantaTeresa = City()
        SantaTeresa.mainPicture = "santaTeresaMainPic"
        SantaTeresa.Name = "Santa Teresa"
        SantaTeresa.quickDescription = "A doce terra dos colibris"
        
        let PedraAzul = City()
        PedraAzul.mainPicture = "pedraAzulMainPic"
        PedraAzul.Name = "Pedra Azul"
        PedraAzul.quickDescription = "A queridinha, internacional, romantica"
        
        newArray.append(AlfredoChaves)
        newArray.append(SantaTeresa)
        newArray.append(PedraAzul)
        
        cityTableView.separatorStyle = .none
        
        return newArray
    }
}
