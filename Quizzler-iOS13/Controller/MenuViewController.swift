//
//  MenuViewController.swift
//  Quizzler-iOS13
//
//  Created by Cesar Ciello on 01/03/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var intiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func initGame(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToGame", sender: self)
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
