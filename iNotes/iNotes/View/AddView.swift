//
//  AddView.swift
//  iNotes
//
//  Created by Diego Vazquez Sanchez on 27/03/24.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var model: ViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            Text(model.updateItem != nil ? "Edit Note 🗒️" : "Add Note 🗒️")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.note)
            Divider()
            DatePicker("Select a Date", selection: $model.date)
            Spacer()
            Button {
                
                model.updateItem != nil ? model.editData(context: context) : model.saveData(context: context)
                
            } label: {
                Text("+ Save")
                    .foregroundColor(.white)
                    .bold()
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(model.note != "" ? Color.blue : Color.gray)
            .cornerRadius(8)
            .disabled(model.note == "" ? true : false)
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(model: ViewModel())
    }
}
