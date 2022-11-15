//
//  ListViewController.swift
//  Barkle
//
//  Created by Foxy Roxy on 11/15/22.
//

import UIKit
import SwiftUI

class ListViewController: UIViewController {

    @IBOutlet weak var theContainer : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let childview = UIHostingController(rootView: SwiftUIListView())
        addChild(childview)
        childview.view.frame = theContainer.bounds
        theContainer.addSubview(childview.view)
        
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
