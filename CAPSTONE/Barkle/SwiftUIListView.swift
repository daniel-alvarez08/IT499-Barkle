//
//  SwiftUIListView.swift
//  Barkle
//
//  Created by Foxy Roxy on 11/15/22.
//

import SwiftUI

struct SwiftUIListView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    let persistenceController = PersistenceController.shared
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var barkleDB: FetchedResults<DogList>
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Button("Click This to Add a Dog") {
                let db = DogList(context: managedObjectContext)
                db.name = "Conan"
            }
            Text("This Starts the List")
            List(barkleDB) { listdogs in
                Text(listdogs.name ?? "unknown")
                
            }
            Text("This Ends the List")
                    
                    }
                }
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("xxxxxxxxxxx it didnt save")
            }
        }
    }
}

//struct SwiftUIListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIListView()
//    }
//}
