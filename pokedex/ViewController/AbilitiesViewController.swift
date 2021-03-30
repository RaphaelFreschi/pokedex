//
//  AbilitiesViewController.swift
//  pokedex
//
//  Created by Raphael Freschi on 28/03/21.
//

import UIKit

class AbilitiesViewController: UIViewController {
    
    @IBOutlet var abilitiesTable: UITableView!
    var abilities: [DisplayableAbilities] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        abilitiesTable.dataSource = self
        abilitiesTable.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension AbilitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "abilityCell", for: indexPath) as! AbilitiesTableViewCell
        
        cell.nameAbility.text = self.abilities[indexPath.row].AbilitieName.name.replacingOccurrences(of: "-", with: " ")
        
        return cell
    }
    
    
}

extension AbilitiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.requestDescription(url: self.abilities[indexPath.row].AbilitieName.url)
    }
    
}
