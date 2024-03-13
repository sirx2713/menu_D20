//
//  ContentView.swift
//  menu_D20
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/12.
//

import SwiftUI

struct MenuView: View {
    
    @State var menuItems: [MenuItem] = [MenuItem]()
    var dataService = DataService()
    
    
    var body: some View {
        
        List(menuItems){item in
            
            HStack{
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 48)
                    .cornerRadius(10)
                Text(item.name)
                    .bold()
                Spacer()
                Text("$" + item.price)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(
                Color(.systemBrown)
                    .opacity(0.1))
            
        }
        .listStyle(.plain)
        .onAppear(perform: {
            menuItems = dataService.getdata()
        })
    }
}

#Preview {
    MenuView()
}
