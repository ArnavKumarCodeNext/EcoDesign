//
//
//  ContentView.swift
//  EcoDesingMark2
//
//  Created by Arnav Kumar on 12/14/22.
//

import SwiftUI
import Auth0
import AVKit

struct ContentView: View {
    @State private var isShowingDetailView = false
    @State private var isShowingDetailView2 = false
    @State private var isAuthenticated = false
    @State private var isShowingTabView = false
//    @State var userProfile: User?
    
//-----------------------LANDING PAGE VIEW------------------
    var body: some View {
        
        NavigationView{
        ZStack{
        HStack{
                Image(systemName: "leaf.fill").foregroundColor(Color(red: 220 / 255, green: 176 / 255, blue: 51 / 255)).font(Font.custom("GochiHand-Regular", size: 50, relativeTo: .title))
                Text("Eco Design")
                    .font(Font.custom("Voga", size: 50, relativeTo: .title))
            
            }
            HStack {
                            NavigationLink(destination: TabbedPageView(), isActive: $isShowingDetailView) { EmptyView() }

                            Button("For Him") {
                                isShowingDetailView = true
                                isShowingTabView = true
                            }.position(x: 275, y: 550).buttonStyle(.bordered).foregroundStyle(
                                LinearGradient(
                                    colors: [.teal, .indigo],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                NavigationLink(destination: For_Her2(), isActive: $isShowingDetailView2) { EmptyView() }

                Button("For Her") {
                    isShowingDetailView2 = true
                }.position(x: -75, y: 550).buttonStyle(.bordered).foregroundStyle(
                    LinearGradient(
                        colors: [.teal, .indigo],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

                                          }
        }.background(Image("Eco7").resizable()).navigationBarBackButtonHidden(true).ignoresSafeArea()    }
}
}
//------------Auth 0 integration ------------//
extension ContentView{
    private func login() {
        Auth0
            .webAuth()
            .start { result in
               switch result{
                case .failure(let error):
                    print("Failed with: \(error)")
                    
                case .success(let credentials):
                    self.isAuthenticated = true
                    print("Credentials: \(credentials)")
                    print("ID token: \(credentials.idToken)")
                }
            }
    }
    private func logout() {
        Auth0
            .webAuth()
            .start{ result in
                switch result {
                case .failure(let error):
                    print("Failed with \(error)")
                case .success:
                    self.isAuthenticated = false
                }
                
            }
    }
    
}
//-----------------------TAB_VIEW FUNCTION---------------------------
struct TabbedPageView: View {
    var body: some View {
        TabView {
            For_Him()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Him")
                }
            
            For_Her2()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Her")
                }
            
            CustomView1()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("A.I")
                }
            MyClosetView()
                .tabItem{
                    Image(systemName: "3.square.fill")
                    Text("Closet")
                }
        }.navigationBarBackButtonHidden(true)
        
    }
}

//-----------------------FOR_HIM PAGE VIEW ----------------------------
struct For_Him: View{
    
  var body: some View{
 
            ScrollView{
                
//                VStack{
//                    Text("For Him")
//                        .font(Font.custom("GochiHand-Regular", size: 55, relativeTo: .title))
//                        .foregroundColor(Color.black)
//
//
//                }
                Text("Exclusive").font(Font.custom("Voga", size: 45, relativeTo: .title)).foregroundColor(Color.white)
                VStack{
                NavigationLink(destination: For_Him_Minimalist()) {
                    
                    Image("Min1").resizable().frame(width: 360, height: 480)
                        .cornerRadius(15)

                }
                    Text("Minimalist")
                        .font(Font.custom("Voga", size: 45, relativeTo: .title))
                        .foregroundColor(Color.white)
                    Divider().frame(width: 275, height: 3)
                        .overlay(.black).padding(10)
                }
                VStack{
                    
                NavigationLink(destination: Text("Second View")) {
                    Image("6")
                    .resizable().frame(width: 360, height: 480)
                    .cornerRadius(15)

                }
                    Text("Ethinic")
                        .font(Font.custom("Voga", size: 45, relativeTo: .title))
                        .foregroundColor(Color.white)
                    Divider().frame(width: 275, height: 3)
                        .overlay(.black).padding(10)
                }
                VStack{
                    
                NavigationLink(destination: Text("Second View")) {
                    Image("busc").resizable().frame(width: 360, height: 480)
                        .cornerRadius(15)

                }
                    Text("Business Casual")
                        .font(Font.custom("Voga", size: 45, relativeTo: .title))
                        .foregroundColor(Color.white)
                    Divider().frame(width: 275, height: 3)
                        .overlay(.black).padding(10)
                }
                
            }.navigationBarBackButtonHidden(true).background(Image("Eco8")).navigationBarTitle(Text("Minimalist").font(Font.custom("Voga", size: 45, relativeTo: .title)))
        }
    }
//-----------------------For_HER2-------------------
struct For_Her2: View{
    
  var body: some View{
 
            ScrollView{
                
//                VStack{
//                    Text("For Him")
//                        .font(Font.custom("GochiHand-Regular", size: 55, relativeTo: .title))
//                        .foregroundColor(Color.black)
//
//
//                }
                VStack{
                    Text("Exclusive").font(Font.custom("Voga", size: 45, relativeTo: .title)).foregroundColor(Color.white)
                NavigationLink(destination: Text("I work")) {
                    
                    Image("1").resizable().frame(width: 360, height: 480)
                        .cornerRadius(15)

                }
                    Text("Minimalist")
                        .font(Font.custom("Voga", size: 45, relativeTo: .title))
                        .foregroundColor(Color.white)
                    Divider().frame(width: 275, height: 3)
                        .overlay(.black).padding(10)
                }
                VStack{
                    
                NavigationLink(destination: Text("Second View")) {
                    Image("eth1")
                    .resizable().frame(width: 360, height: 480)
                    .cornerRadius(15)

                }
                    Text("Ethinic")
                        .font(Font.custom("Voga", size: 45, relativeTo: .title))
                        .foregroundColor(Color.white)
                    Divider().frame(width: 275, height: 3)
                        .overlay(.black).padding(10)
                }
                VStack{
                    
                NavigationLink(destination: Text("Second View")) {
                    Image("bbc").resizable().frame(width: 360, height: 480)
                        .cornerRadius(15)

                }
                    Text("Business Casual")
                        .font(Font.custom("Voga", size: 45, relativeTo: .title))
                        .foregroundColor(Color.white)
                    Divider().frame(width: 275, height: 3)
                        .overlay(.black).padding(10)
                }
                
            }.navigationBarBackButtonHidden(true).background(Image("Eco8"))
      
        }
    }

//-----------------------FOR_HIM_CASUAL PAGE----------------------------
struct For_Him_Casual: View{
    @State private var isShowingDetailView123 = false
    var body: some View{
       
            ScrollView{
                
                VStack{
                    NavigationLink(destination: AI(), isActive: $isShowingDetailView123) { EmptyView() }

                    Button("Personalize My Outfit") {
                        isShowingDetailView123 = true
                    }.buttonStyle(.borderedProminent)
                ZStack{
                    
                NavigationLink(destination: Text("Cost:$25")) {
                    Image("9").resizable().frame(width: 360, height: 480).cornerRadius(15).padding()}
                    
                }
                ZStack{
                NavigationLink(destination: Text("Cost: $20")) {
                    Image("10").resizable().frame(width: 360, height: 480).cornerRadius(15).padding()}

                }
                ZStack{
                NavigationLink(destination: Text("Cost: $30")) {
                    Image("11").resizable().frame(width: 320, height: 500).cornerRadius(15).padding()}
                    
                }
                
                }
                
            }
        }
    }
struct For_Him_Minimalist: View{
    @State private var isShowingDetailView123 = false
    var body: some View{
       
            ScrollView{
                
                VStack{
                    HStack{
                        NavigationLink(destination: AI(), isActive: $isShowingDetailView123) { EmptyView() }
                        
                        Button("Lower") {
                            isShowingDetailView123 = true
                        }.buttonStyle(.borderedProminent).padding(10)
                        //-------------
                        NavigationLink(destination: AI(), isActive: $isShowingDetailView123) { EmptyView() }
                        
                        Button("Upper") {
                            isShowingDetailView123 = true
                        }.buttonStyle(.borderedProminent).padding(10)
                        //-------------
                        NavigationLink(destination: AI(), isActive: $isShowingDetailView123) { EmptyView() }
                        
                        Button("Accesories") {
                            isShowingDetailView123 = true
                        }.buttonStyle(.borderedProminent).padding(10)
                    }
                ZStack{
                    
                NavigationLink(destination: Min4()) {
                    Image("Min4").resizable().frame(width: 360, height: 480).cornerRadius(15).padding()}
                    
                }
                ZStack{
                NavigationLink(destination: Text("Cost: $20")) {
                    Image("Min5").resizable().frame(width: 360, height: 480).cornerRadius(15).padding()}

                }
                ZStack{
                NavigationLink(destination: Text("Cost: $30")) {
                    Image("Min2").resizable().frame(width: 320, height: 500).cornerRadius(15).padding()}
                    
                }
                
                }
                
            }.background(Image("Eco8")).navigationBarTitle(Text("Minimalist").font(Font.custom("Voga", size: 45, relativeTo: .title)))
        }
    }
struct PurchaseButton: View {
    var body: some View {
        Button(action: {
            // Action to perform when the button is tapped
        }) {
            HStack(spacing: 10) {
                Image(systemName: "cart")
                Text("Purchase")
                    .fontWeight(.bold)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
    }
}

struct Min4: View{
    var body: some View{
        ScrollView{
            VStack{
               
                Image("Min4").resizable().frame(width: 360, height: 480).cornerRadius(15).padding()
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "cart")
                        Text("Purchase")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                Divider().frame(width: 275, height: 3)
                    .overlay(.black).padding(10)
                Text("Manufacturing Details:").font(Font.custom("Voga", size: 45, relativeTo: .title))
                Text("""

    Made with utmost care and precision, this cream t-shirt and black jeans ensemble was thoughtfully manufactured in a state-of-the-art facility nestled in the picturesque countryside of Verdena, a sustainable fashion hub renowned for its eco-friendly production practices.
""").padding(25)
                Text("Fabric Composition:").font(Font.custom("Voga", size: 45, relativeTo: .title))
                Text("""
                     
                     The cream t-shirt is delicately crafted from a luxurious blend of organic cotton and Tencel, a sustainable fabric derived from eucalyptus trees. The black jeans, on the other hand, are expertly tailored using a blend of organic cotton and upcycled denim, reducing waste while maintaining durability and style.
                     """).padding(25)
                Text("Imported from: Italy").font(Font.custom("Voga", size: 45, relativeTo: .title))
                
               
        
                
            }
        }.background(Image("Eco7").resizable().ignoresSafeArea())
    }
    
}
//-----------------------AI PAGE VIEW ----------------------------

//-----------------------For Her PAGE VIEW ----------------------------
struct For_Her: View{
    var body: some View{
        ScrollView{
            VStack{
            ZStack{
                
            NavigationLink(destination: Text("Second View").font(Font.custom("Voga", size: 45, relativeTo: .title))) {
                Image("1").resizable().frame(width: 360, height: 480)}
                Text("casual")
            }
            ZStack{
            NavigationLink(destination: Text("Second View").font(Font.custom("Voga", size: 45, relativeTo: .title))) {
                Image("2").resizable().frame(width: 360, height: 480)}
                Text("Business Casual").font(Font.custom("Voga", size: 45, relativeTo: .title))
            }
            ZStack{
            NavigationLink(destination: Text("Second View").font(Font.custom("Voga", size: 45, relativeTo: .title))) {
                Image("3").resizable().frame(width: 320, height: 500)}
                Text("Formal").font(Font.custom("Voga", size: 45, relativeTo: .title))
            }
            
            }
            
        }.background(Image("Eco8"))
    }
}
//-----------------------PERSONALIZED PAGE VIEW--------------------------
struct Personalized: View{
    var body: some View{
        ScrollView{
            
            VStack{
                Image("Fin002").resizable().frame(width: 360, height: 480).cornerRadius(15).padding()
                Image("fin1").resizable().frame(width: 360, height: 480).cornerRadius(15).padding()
                Image("fin4").resizable().frame(width: 360, height: 480).cornerRadius(15).padding()
                Image("fin5").resizable().cornerRadius(15).padding()
            }
        }.background(Image("Eco8"))
    }
}

//-----------------------UPLOAD CLOSET VIEW------------------------
//struct Upload: View{
//    var body: some View{
//        
//    }
//}
//-----------------------LANDING PAGE  ----------------------------
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
