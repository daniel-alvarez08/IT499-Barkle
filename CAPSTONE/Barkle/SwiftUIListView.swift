//
//  SwiftUIListView.swift
//  Barkle
//
//  Created by Roxanna P on 11/15/22.
//

import SwiftUI

struct SwiftUIListView: View {
    let vc = ViewController()
    var dogs:[Dog] = []
    
    @Environment(\.managedObjectContext) var moc
    let persistenceController = PersistenceController.shared
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var barkleDB: FetchedResults<DogList>
    
    var body: some View {
        //var cDog = vc.dogs.count
        let currentDog = dogs[dIndex.index]
        VStack {
            //var currentDog = dogs[vc.dogIndex]
            
            Text("\(barkleDB.count)")
            Text("\(dIndex.index)")
            Text("\(currentDog.Title)")
            Button("Click This to Add a Dog") {
                let db = DogList(context: moc)
                db.name = currentDog.Title
                PersistenceController.shared.save()
            }
            Text("This Starts the List")
            List(barkleDB) { listdogs in
                Text(listdogs.name ?? "unknown")
                
            }
            Text("This Ends the List")
                    
                    }
                }
//    func save() {
//        let context = container.viewContext
//
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                print("xxxxxxxxxxx it didnt save")
//            }
//        }
//    }
}

//struct SwiftUIListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIListView()
//    }
//}
