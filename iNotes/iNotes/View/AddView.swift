//
//  AddView.swift
//  iNotes
//
//  Created by Diego Vazquez Sanchez on 27/03/24.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var model: ViewModel
    
    var body: some View {
        VStack {
            Text("Add Note 🗒️")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.note)
            Divider()
            DatePicker("Select a Date", selection: $model.date)
            Spacer()
            Button {
                 print("Save note")
            } label: {
                Text("+ Save")
                    .foregroundColor(.white)
                    .bold()
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(Color.blue)
            .cornerRadius(8)

        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(model: ViewModel())
    }
}
