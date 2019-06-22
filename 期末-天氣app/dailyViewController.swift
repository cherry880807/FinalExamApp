//
//  dailyViewController.swift
//  期末-天氣app
//
//  Created by User02 on 2019/6/22.
//  Copyright © 2019 00657123. All rights reserved.
//

import UIKit


class dailyViewController: UIViewController {
    var daily:Daily?

    
   
    @IBOutlet var dailyThemeText: UITextView!
    @IBOutlet var completeButton: UIBarButtonItem!
    @IBOutlet var dailyTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var dateFormat:DateFormatter
        dateFormat = DateFormatter().self
        dateFormat.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        let dailyInput=dailyTextView.text ?? ""
        let datestring = dateFormat.string(from: Date.init())
        let dailyTheme = dailyThemeText.text ?? ""
        daily=Daily(dailytext: dailyInput, date: datestring,theme:dailyTheme)
        
    }

}
