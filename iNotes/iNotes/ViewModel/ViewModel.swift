//
//  ViewModel.swift
//  iNotes
//
//  Created by Diego Vazquez Sanchez on 27/03/24.
//

import Foundation
import CoreData
import SwiftUI

class ViewModel: ObservableObject {
    @Published var note = ""
    @Published var date = Date()
    @Published var show = false
    
    //Core Data
    
    func saveData(context: NSManagedObjectContext) {
        let newNote = Notes(context: context)
        newNote.note = note
        newNote.date = date
        
        do {
            try context.save()
            print("Note Saved Succesfully")
            show.toggle()
        } catch let error as NSError {
            //Alerta al usuario
            print("Note has not been saved, \(error.localizedDescription)")
        }
    }
    
}
