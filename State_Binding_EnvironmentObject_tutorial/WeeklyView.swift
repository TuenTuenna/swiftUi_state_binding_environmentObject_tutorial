//
//  TodyView.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by Jeff Jeong on 2021/09/11.
//

import Foundation
import SwiftUI

struct WeeklyView: View {
    
    @EnvironmentObject var viewModel : MyViewModel
    
    @Binding var count : Int

    @State var title : String = ""
    
    init(count: Binding<Int> = .constant(99)) {
        _count = count
    }
    
    var body: some View{
        VStack{
            Text(title)
                .font(.system(size: 26))
                .fontWeight(.bold)
                .padding()
            Text("자기전에 빡코딩! count: \(count)")
                .padding()
            Button(action: {
                count = count + 1
            }, label: {
                Text("카운트 업")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10.0)
            })
        }.onReceive(viewModel.$appTitle, perform: { receivedAppTitle in
            print("BeforeBadView - receivedAppTitle: ", receivedAppTitle)
            title = receivedAppTitle
        })
    }
}
