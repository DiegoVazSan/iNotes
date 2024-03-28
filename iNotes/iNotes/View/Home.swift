//
//  Home.swift
//  iNotes
//
//  Created by Diego Vazquez Sanchez on 27/03/24.
//

import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    
    var body: some View {
        Button {
            model.show.toggle()
        } label: {
            Text("+").bold()
        }.sheet(isPresented: $model.show) {
            AddView(model: model)
        }

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
