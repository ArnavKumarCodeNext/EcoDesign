import SwiftUI

struct CustomView1: View {
    let skin_color = ["White", "Dark Brown", "Brown"]
    let size = ["XS", "S", "M", "L", "XL"]
    let height = ["5 feet", "5.5 feet", "6 feet", "6.5 feet"]
    let style = ["Casual","Minimalist","Business Casual","Ethinic"]
    
    @State private var selectedStudent = "Dark Brown"
    @State private var abcd = "XL"
    @State private var lol = "5 feet"
    @State private var Casual = "Casual"
    @State private var isShowingDetailView123 = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("How to use:")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Step 1: Go to the upload page and upload your closet.")
                    .padding(.vertical)
                
                Text("Step 2: Put in information about your body type below.")
                    .padding(.horizontal)
                
                Form {
                    Section(header: Text("Body Information")) {
                        Picker("Skin Complexion", selection: $selectedStudent) {
                            ForEach(skin_color, id: \.self) { color in
                                Text(color)
                            }
                        }
                        
                        Picker("Select Size", selection: $abcd) {
                            ForEach(size, id: \.self) { size in
                                Text(size)
                            }
                        }
                        
                        Picker("Height", selection: $lol) {
                            ForEach(height, id: \.self) { height in
                                Text(height)
                            }
                        }
                        Picker("Style", selection: $Casual) {
                            ForEach(style, id: \.self) { height in
                                Text(height)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Text("Step 3: Click on 'My Personalized Design'.")
                    .padding(.horizontal)
                
                Text("Recommended: Purchase Eco-Design premium for more outfit designs at once.")
                    .padding()
                
                Spacer()
                
                Button(action: {
                    // Handle button action here
                    isShowingDetailView123 = true
                }) {
                    Text("Go to my A.I.")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .sheet(isPresented: $isShowingDetailView123) {
                    AI()
                }
            }
            .background(Image("Eco8")
                            .padding()
            )
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
        }
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView1()
    }
}
