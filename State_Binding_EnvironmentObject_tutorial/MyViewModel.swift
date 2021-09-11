//
//  MyViewModel.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by Jeff Jeong on 2021/09/11.
//

import Foundation
import Combine

class MyViewModel: ObservableObject {
    
    @Published var appTitle : String = "빡코딩의 일상"
    
}
