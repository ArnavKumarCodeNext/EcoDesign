//
//  AIView.swift
//  EcoDesingMark2
//
//  Created by Arnav Kumar on 6/16/23.
//

import SwiftUI

//struct CustomView: View {
//    let skin_color = ["White", "Dark Brown", "Brown"]
//    let size = ["XS", "S", "M", "L", "XL"]
//    let height = ["5 feet", "5.5 feet", "6 feet", "6.5 feet"]
//
//    @State private var selectedStudent = "Dark Brown"
//    @State private var abcd = "XL"
//    @State private var lol = "5 feet"
//    @State private var isShowingDetailView123 = false
//
//    var body: some View {
//        ScrollView {
//            VStack {
//                Text("How to use:")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding()
//
//                Text("Step 1: Go to the upload page and upload your closet.")
//                    .padding(.vertical)
//
//                Text("Step 2: Put in information about your body type below.")
//                    .padding(.horizontal)
//
//                Form {
//                    Section(header: Text("Body Information")) {
//                        Picker("Skin Complexion", selection: $selectedStudent) {
//                            ForEach(skin_color, id: \.self) { color in
//                                Text(color)
//                            }
//                        }
//
//                        Picker("Select Size", selection: $abcd) {
//                            ForEach(size, id: \.self) { size in
//                                Text(size)
//                            }
//                        }
//
//                        Picker("Height", selection: $lol) {
//                            ForEach(height, id: \.self) { height in
//                                Text(height)
//                            }
//                        }
//                    }
//                }
//                .padding(.horizontal)
//
//                Text("Step 3: Click on 'My Personalized Design'.")
//                    .padding(.horizontal)
//
//                Text("Recommended: Purchase Eco-Design premium for more outfit designs at once.")
//                    .padding()
//
//                Spacer()
//
//            }
//            .background(Image("Eco8")
//                            .padding()
//            )
//            .padding()
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(false)
//        }
//    }
//}



struct AI: View{
    let skin_color = ["White", "Dark Brown", "Brown"]
    let size = ["XS","S","M","L","XL"]
    let height = ["5 feet","5.5 feet", "6 feet", "6.5 feet"]
    let style = ["Casual","Minimalist","Business Casual","Ethinic"]
    @State private var selectedStudent = "Dark Brown"
    @State private var abcd = "XL"
    @State private var lol = "5 feet"
    @State private var Casual = "Casual"
    @State private var isShowingDetailView123 = false
    var body: some View{
        VStack{
                      
            NavigationView {
                
                Form {
                    Picker("Skin Complexion ", selection:
                            $selectedStudent) {
                        ForEach(skin_color, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Select Size ", selection:
                            $abcd) {
                        ForEach(size, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Height ", selection:
                            $lol) {
                        ForEach(height, id: \.self) {
                            Text($0)
                        }
                    }
                   
                    Picker("Style", selection: $Casual) {
                        ForEach(style, id: \.self) { height in
                            Text(height)
                        }
                    }
                    NavigationLink(destination: Personalized()) {
                        Text("My personalized Design").bold().font(Font.custom("Voga", size: 45, relativeTo: .title))}
                    
                }
                
                
                
                
                
            }
            
        }.navigationBarBackButtonHidden(true).background(
            Image("Eco7")
                .resizable()
                .scaledToFill()
        )
    }
}

struct CustomView1_Previews: PreviewProvider {
    static var previews: some View {
        AI()
    }
}
