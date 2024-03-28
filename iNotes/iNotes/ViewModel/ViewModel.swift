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
}
