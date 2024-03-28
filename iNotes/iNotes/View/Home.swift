//
//  Home.swift
//  iNotes
//
//  Created by Diego Vazquez Sanchez on 27/03/24.
//

import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    @FetchRequest(entity: Notes.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var results : FetchedResults<Notes>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(results) { item in
                    
                    VStack(alignment: .leading) {
                        Text(item.note ?? "Unkown")
                            .font(.title)
                            .bold()
                        Text(item.date ?? Date(), style: .date)
                    }
                    
                }
            }
            .navigationTitle("Reminders")
            .navigationBarItems(trailing: Button(action: {
                model.show.toggle()
            }, label: {
                Text("🗒️")
            })).sheet(isPresented: $model.show, content: {
                AddView(model: model)
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
