//
//  ResultViewController.swift
//  Quizzler-iOS13
//
//  Created by Cesar Ciello on 01/03/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var scoreValue: String?
    var mesageValue: String?
    var testCrtl: UIViewController?

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var mesageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = scoreValue
        mesageLabel.text = mesageValue
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
