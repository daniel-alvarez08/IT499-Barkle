//
//  ListViewController.swift
//  Barkle
//
//  Created by Roxanna P on 11/15/22.
//

import UIKit
import SwiftUI

class ListViewController: UIViewController {

    @IBOutlet weak var theContainer : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let persistenceController = PersistenceController.shared
        let childview = UIHostingController(rootView: SwiftUIListView().environment(\.managedObjectContext, persistenceController.container.viewContext))
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
