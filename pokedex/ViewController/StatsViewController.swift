//
//  StatsViewController.swift
//  pokedex
//
//  Created by Raphael Freschi on 29/03/21.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var HP: UIProgressView!
    @IBOutlet weak var Attack: UIProgressView!
    @IBOutlet weak var Defense: UIProgressView!
    @IBOutlet weak var SAttack: UIProgressView!
    @IBOutlet weak var SDefense: UIProgressView!
    @IBOutlet weak var Speed: UIProgressView!
    
    var data: Displayable?
    var stats: [DisplayableDetails] = []
    
    func setDataFromDetails(stats: [DisplayableDetails]) {
        self.stats = stats
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.HP.setProgress(0.0, animated: true)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
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
