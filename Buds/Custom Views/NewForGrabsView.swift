//
//  UploadPhotoView.swift
//  Buds
//
//  Created by Andrea Wang Admin on 8/5/21.
//

import SwiftUI
import PhotosUI

struct NewForGrabsView: View {
    
    @EnvironmentObject var postingViewModel:PostingViewModel
    
    private let buttonWidth:CGFloat = (UIScreen.main.bounds.width - 30) / 2
    private let buttonHeight:CGFloat = 60
    
    @State var images: [UIImage] = []
    @State var picker = false
    @State private var title:String = ""
    @State private var description:String = ""
    @State private var selectedDate = Date()
    @State private var tags:[String] = []
    
    @State private var postButtonLabel = "POST"
    @State private var postButtonPressed = false
    
    
    var body: some View {
        
        
        ScrollView(showsIndicators: false) {
            TopLeftTitle(title: "new for grabs post")
            
            if !images.isEmpty{
                PickedImages(images: images)
            }
            else{
                Button(action:{
                    picker.toggle()
                }){
                    VStack {
                        Image(systemName: "plus.rectangle.fill")
                            .font(.system(size: 160))
                            .foregroundColor(.gray)
                        
                        Text("upload photo")
                            .font(.custom("Avenir Medium", size: 18))
                            .foregroundColor(Color("Dark Teal"))
                    }
                }
            }
            
            VStack {
                // Title textfield
                PostInfoFieldLabel(label: "Title")
                    .padding(.top, -10)
                TextField("Title", text: $title)
                    .padding(.horizontal)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(TealRectangleTextFieldStyle())
                
                // Description textfield
                PostInfoFieldLabel(label: "Description")
                TextEditor(text: $description)
                    .font(.custom("Helvetica Neue", size: 14))
                    .foregroundColor(Color("Dark Teal"))
                    .padding(.horizontal, 5)
                    .frame(height: 150)
                    .border(Color("Teal"), width: 2)
                    .padding(.horizontal)
                
                // Collect by
                PostInfoFieldLabel(label: "Collect By")
                DatePicker("Select date and time:", selection: $selectedDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                    .padding(.horizontal)
                    .font(.custom("Avenir", size: 16))
                    .foregroundColor(Color("Dark Teal"))
                    .accentColor(Color("Teal"))
                
                // Tags
                PostInfoFieldLabel(label: "Tags")
                FilterButtonsView(toggledButtons: $tags)
            }
            .padding(.bottom, 40)
            
            NavigationLink(
                destination: ButtonBarView(),
                isActive: $postButtonPressed,
                label: {
                    Button(postButtonLabel) {
                        postButtonLabel = "POSTING..."
                        postingViewModel.postToForGrabs(title: title, description: description, selectedDate: selectedDate, tags: tags) {
                            postButtonPressed = true
                        }
//                        postButtonPressed = true
                    }
                    .buttonStyle(WhiteTextTealBackgroundButton(width: buttonWidth, height: buttonHeight))
                })
            
//            Button(postButtonLabel) {
//                postButtonLabel = "POSTING..."
////                postingViewModel.postToForGrabs(title: title, description: description, selectedDate: selectedDate, tags: tags) {
////                    goForGrabs()
////                }
//                goForGrabs()
//            }
//            .buttonStyle(WhiteTextTealBackgroundButton(width: buttonWidth, height: buttonHeight))
        }
        .sheet(isPresented: $picker){
            ImagePicker(images: $images, picker: $picker)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct PickedImages: View {
    
    var images: [UIImage]
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false, content:{
                HStack(alignment: .top, spacing: 15){
                    ForEach(images, id: \.self){ img in
                        Image(uiImage: img)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 35, height: 250)
                            .offset(x: UIScreen.main.bounds.width/25)
                    }
                }
            })
            .padding(.bottom, 10)
        }
    }
}

func goForGrabs() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ButtonBarView())
        window.makeKeyAndVisible()
    }
}


//New Image Picker API
struct ImagePicker : UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        return
    }
    
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent1: self)
    }
    
    @Binding var images : [UIImage]
    @Binding var picker : Bool
    
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        var config = PHPickerConfiguration()
        
        config.filter = .images //selecting only images in picker
        config.selectionLimit = 0 //for multiple selection
        
        let picker = PHPickerViewController(configuration: config)
        //adding delegate
        picker.delegate = context.coordinator
        return picker
    }
    
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate{
        
        var parent : ImagePicker
        
        init(parent1: ImagePicker){
            parent = parent1
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            //closing picker
            parent.picker.toggle()
            
            for img in results{
                
                //checking whether the image can be loaded
                
                if img.itemProvider.canLoadObject(ofClass: UIImage.self){
                    
                    //retriving the selected Image
                    
                    img.itemProvider.loadObject(ofClass: UIImage.self){ (image, err) in
                        
                        guard let image1 = image else{
                            print(err)
                            return
                        }
                        
                        //appending image
                        self.parent.images.append(image1 as! UIImage)
                        
                    }
                    
                }
                else{
                    //can't be loaded
                    print("can't be loaded")
                }
                
            }
        }
    }
    
}


struct UploadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewForGrabsView()
            //            NewForGrabsView()
        }
    }
}
