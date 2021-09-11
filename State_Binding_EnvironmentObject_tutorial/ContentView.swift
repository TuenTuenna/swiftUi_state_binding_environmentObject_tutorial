//
//  ContentView.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by Jeff Jeong on 2021/09/11.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : MyViewModel
    
    @State var count = 0
    
    @State var appTitle : String = ""
    
//    var appTitle :String
    
//    init(appTitle: String = "빡코딩의 일상") {
//        self.appTitle = appTitle
//    }
    
    var body: some View {
        
        TabView{
                VStack{
                    Text("오늘도 빡코딩! count: \(count)")
                        .padding()
                    Button(action: {
                        count = count + 1
                        viewModel.appTitle = "빡코딩의 일상 \(count)일차"
                    }, label: {
                        Text("카운트 업")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10.0)
                    })
                }
                .tabItem { Label("오늘도", systemImage: "pencil.circle") }
            
            BeforeBedView(count: $count)
                .tabItem { Label("자기전에", systemImage: "folder.fill") }
            
            WeeklyView(count: $count)
                .tabItem { Label("주말에도", systemImage: "paperplane.fill") }
        }// TabView
        .overlay(Text(appTitle).offset(y: -(UIScreen.main.bounds.height * 0.4)))
        .onReceive(viewModel.$appTitle, perform: { receivedAppTitle in
            print("ContentView receivedAppTitle:", receivedAppTitle)
            appTitle = receivedAppTitle
        })

    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
