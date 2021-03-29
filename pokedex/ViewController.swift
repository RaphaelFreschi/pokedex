//
//  ViewController.swift
//  pokedex
//
//  Created by Raphael Freschi on 28/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pokeTableView: UITableView!
    
    var lines = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pokeTableView.dataSource = self
        pokeTableView.delegate = self
        pokeTableView.register(UINib(nibName: "PokeCell", bundle: nil), forCellReuseIdentifier: "pokedexCell")
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lines
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokedexCell", for: indexPath) as! PokeTableViewCell
        
        cell.initCell(name: "Bulbasaur")
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        
        performSegue(withIdentifier: "listToDetail", sender: nil)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position  = scrollView.contentOffset.y
        if position > (pokeTableView.contentSize.height - 100 - scrollView.frame.size.height){
            self.lines += 10
            pokeTableView.reloadData()
        }
    }
    
}

