//
//  ContentView.swift
//  Jelly
//
//  Created by Pratik Byathnal on 27/05/20.
//  Copyright © 2020 Pratik Byathnal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    @State private var status = false
    @State private var timeout = false
    
    var body: some View {
        TabView{
            VStack {
                Toggle(isOn: $status) {
                    Text("Open at login")
                }
                
                Toggle(isOn: $timeout){
                    Text("Hide after 5 seconds")
                }
                
                Button(action: {
                    //do reset of the app
                }){
                    Text("Reset")
                }.padding()
                
                if status{
                    //force app to start at login
                }
                
                if timeout{
                    //hide icons after 5 seconds
                }
            }
            .tabItem{
                Text("General")
            }
            
            VStack{
    
                Text("Jelly v1.0.0")
                
            }.tabItem{
            Text("About")
            
            }
        }
        
        
      
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
