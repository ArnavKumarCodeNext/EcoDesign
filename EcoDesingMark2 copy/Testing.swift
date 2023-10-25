import SwiftUI
import PhotosUI

struct MyClosetView: View {
    let shirtImages: [String] = [
        "up1",
        "up2",
        "up3","Fin002"
        // Add more shirt image names here
    ]
    
    let pantsImages: [String] = [
        "up5",
        "up4",
        "up6","up7","up8","fin1"
        // Add more pants image names here
    ]
    
    let socksImages: [String] = [
        "up9",
        "up10",
        "up11","up12","fin5","fin4"
        // Add more socks image names here
    ]
    
    let shoesImages: [String] = [
        "up12",
        "shoes2",
        "shoes3",
        // Add more shoes image names here
    ]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    @State private var isShowingGallery = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Button("Add to my Closet") {
                                    isShowingGallery = true
                                }
                                .font(.system(size: 15))
                                .padding(10)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .sheet(isPresented: $isShowingGallery) {
                                    ImageGalleryView()
                                }
                    Text("Shirts").font(Font.custom("Voga", size: 45, relativeTo: .title))
                        .font(.headline)
                        .padding(.top, 20)
                    
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(shirtImages, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 100)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                    Divider()
                        .padding(.horizontal)
                    
                    Text("Pants").font(Font.custom("Voga", size: 45, relativeTo: .title))
                        .font(.headline)
                        .padding(.top, 20)
                    
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(pantsImages, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 100)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                    Divider()
                        .padding(.horizontal)
                    
                    Text("Socks & Shoes").font(Font.custom("Voga", size: 45, relativeTo: .title))
                        .font(.headline)
                        .padding(.top, 20)
                    
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(socksImages, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 100)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                }
            }
            .background(Image("Eco8"))
            .navigationTitle(Text("My Closet").font(Font.custom("Voga", size: 45, relativeTo: .title))).font(Font.custom("Voga", size: 45, relativeTo: .title))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
struct ImageGalleryView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // No need to update the view controller
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            for result in results {
                result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let image = image as? UIImage {
                        // Do something with the selected image
                        // For example, save it to your app's data model
                        // or display it in another view
                    }
                }
            }
        }
    }
}
struct MyClosetView_Previews: PreviewProvider {
    static var previews: some View {
        MyClosetView()
    }
}

