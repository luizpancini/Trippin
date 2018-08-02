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
    
    var citiesArray : [City] = [City]()
    
    
    @IBOutlet weak var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.separatorStyle = .none
        
        citiesArray = loadCities()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExplorerCell", for: indexPath) as! CityTableViewCell
        if let image = UIImage(named: citiesArray[indexPath.row].mainPicture) {
            cell.nameLabel.text = citiesArray[indexPath.row].Name
            cell.teaserLabel.text = citiesArray[indexPath.row].quickDescription
            cell.mainPicture.image = image
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToCity", sender: citiesArray[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cvc = segue.destination as! CityViewController
        cvc.thisCity = (sender as? City)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Trippin`"
        navigationController?.navigationBar.barTintColor = UIColor.flatWhite()
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
        
        return newArray
    }
}
