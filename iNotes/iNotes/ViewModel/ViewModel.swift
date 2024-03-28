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
    @Published var updateItem : Notes!
    
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
    
    func deleteData(item:Notes, context: NSManagedObjectContext) {
        context.delete(item)
        //try! context.save()
        do {
            try context.save()
        } catch let error as NSError {
            print("Did not delete note, \(error.localizedDescription)")
        }
    }
    
    func sendData(item: Notes){
        updateItem = item
        note = item.note ?? ""
        date = item.date ?? Date()
        show.toggle()
    }
    
    func editData(context: NSManagedObjectContext){
        updateItem.date = date
        updateItem.note = note
        do {
            try context.save()
            show.toggle()
            print("Did Edit Successfully")
        } catch let error as NSError{
            print("Error trying to edit, \(error.localizedDescription)")
        }
    }
    
}
