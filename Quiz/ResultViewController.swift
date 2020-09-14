//
//  ResultViewController.swift
//  Quiz
//
//  Created by 高山瑞基 on 2020/09/14.
//  Copyright © 2020 Takayama Mizuki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //正解数
    var correctAnswer: Int = 0
    
    //結果を表示するラベル
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if correctAnswer >= 1{
            resultLabel.text = "\(String(correctAnswer))問正解！！"
        } else {
            resultLabel.text = "\(String(correctAnswer))問だった・・・"
        }
    }
    
    @IBAction func back(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
