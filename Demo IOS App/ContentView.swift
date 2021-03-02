//
//  ContentView.swift
//  Demo IOS App
//
//  Created by Rahul Chadalawada on 26/2/21.
//

import SwiftUI

let arrayOne = ["ItemOne" , "ItemTwo", "ItemThree"]

let arrayTwo = ["ItemOne" , "ItemTwo", "ItemThree"]

let arrayThree = ["ItemOne" , "ItemTwo", "ItemThree"]

let arrayFour = ["ItemOne" , "ItemTwo", "ItemThree"]

struct ContentView: View {
    
    var body: some View {
        HStack {
            // MARK: VStack
//            SampleAppNavigation()
            SampleTabView()
            Spacer()
        }
        .foregroundColor(.gray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListView: View {
    var body: some View {
        List{
            Section(header: Text("First Section")){
                ForEach(arrayOne,id:\.self,content:{
                    name in NavigationLink(name,destination: Text(name))
                })
            }
            
            Section(header: Text("Second Section")){
                ForEach(arrayTwo,id:\.self,content:{
                    name in NavigationLink(name,destination: Text(name))
                })
            }
            
            Section(header: Text("Third Section")){
                ForEach(arrayThree,id:\.self,content:{
                    name in NavigationLink(name,destination: Text(name))
                })
            }
            
            Section(header: Text("Fourth Section")){
                ForEach(arrayFour,id:\.self,content:{
                    name in NavigationLink(name,destination: HStack{
                        Image(systemName: "moon.stars")
                        Text(name)
                        
                    })
                })
            }
            
        }.navigationTitle("List Data")
    }
}

struct SampleDataView: View {
    var body: some View {
        VStack{
            Circle()
                .fill(Color.yellow)
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.red)
                .frame(width: 100, height: 100)
            Capsule()
                .fill(Color.green)
                .frame(width: 100, height: 100)
            Ellipse()
                .fill(Color.blue)
                .frame(width: 200, height: 100)
            // MARK: Hstack
            HStack{
                Text("Hello, world!")
                    .underline()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.leading)
                    .padding(7.0)
                    .font(.largeTitle)
                Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                }
            }
            HStack{
                Image(systemName: "moon.stars")
                    .foregroundColor(Color.red)
                Text("Hello, world!")
                    .font(.subheadline)
                    .padding()
            }
            .padding(8.0)
        }
    }
}
// MARK: Navigation View
struct SampleAppNavigation: View {
    var body: some View {
        VStack {
            Group {
                VStack(alignment: .center) {
                    // MARK: Navigation Link 1
                    NavigationView(){
                        VStack{
                            NavigationLink(
                                destination: ListView()
                            ){Text("Open List").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)}
                            .frame(height: 14.0)
                            .navigationTitle("Home")
                            // MARK: Navigation Link2
                            NavigationLink(
                                destination: SampleDataView()){Text("Open sample Data").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)}
                        }
                    }
                    
                }
            }
            Spacer()
        }
    }
}

// MARK: Tab Link 1
struct SampleTabView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            SampleDataView().tabItem { Text("Sample Data")
                Image(systemName: "house")
            }.tag(1)
            ListView().tabItem { Text("List View")
                Image(systemName: "map")
            }.tag(2)
            Text("Settings screen").tabItem { Text("List View")
                Image(systemName: "gear")
            }.tag(3)
        }
    }
}
