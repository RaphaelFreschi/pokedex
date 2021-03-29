//
//  AbilitiesViewController.swift
//  pokedex
//
//  Created by Raphael Freschi on 28/03/21.
//

import UIKit

class AbilitiesViewController: UIViewController {

    @IBOutlet var abilitiesTable: UITableView!
    
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "abilityCell", for: indexPath) as! AbilitiesTableViewCell
        
        return cell
    }
    
    
}

extension AbilitiesViewController: UITableViewDelegate {
    
}
