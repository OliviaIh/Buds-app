//
//  UploadPhotoView.swift
//  Buds
//
//  Created by Andrea Wang Admin on 8/5/21.
//

import SwiftUI
import PhotosUI

struct NewForGrabsView: View {
    
    @State var images: [UIImage] = []
    @State var picker = false
    private let buttonWidth:CGFloat = (UIScreen.main.bounds.width - 30) / 2
    private let buttonHeight:CGFloat = 60
    @State private var selection:String? = nil
    @State private var forgrabstitle:String = ""
    
    var body: some View {
        
        VStack{
            HStack{
                TopLeftTitle(title: "new for grabs post")
                    .padding(.top)
                
            }
            Spacer()
            
            if !images.isEmpty{
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
                    
                    //Title text
                    HStack {
                        Text("Title")
                            .font(.custom("Avenir Medium", size: 20))
                            .foregroundColor(Color("Dark Teal"))
                            .padding([.leading, .top])
                        Spacer()
                            .padding(.bottom, 0)
                    }
                
                    //Title textfield
                    TextField("Title", text: $forgrabstitle)
                        .padding(EdgeInsets(top: 0, leading: UIScreen.main.bounds.width/25, bottom: 20, trailing: UIScreen.main.bounds.width/25))
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(TealRectangleTextFieldStyle())
                    Spacer()
                    

                    
                   
                    
                }
                
                
               
                
                Spacer()
                
                
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Button(action: goForGrabs) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("Post").foregroundColor(Color.white).bold()
                        Spacer()
                    }
                }
                .buttonStyle(WhiteTextTealBackgroundButton(width: buttonWidth, height: buttonHeight))
                
                
        
                
               
            }
            else{
                VStack{
                    Button(action:{
                        picker.toggle()


    //                }, label: {
    //                    Text("Upload Images")
    //
    //                })
                    }){
                        Image(systemName: "plus.rectangle.fill")
                            .font(.system(size: 160))
                            .foregroundColor(.gray)
                        
                    }
                    .position(x: UIScreen.main.bounds.width/2, y:UIScreen.main.bounds.height/8)
                    .frame(height: 190)
                    
                    Text("Upload Photo")
                        .font(.custom("Avenir Medium", size: 25))
                        .foregroundColor(Color("Dark Teal"))
                        .position(x: UIScreen.main.bounds.width/2, y:UIScreen.main.bounds.height/40)
                   
                    
                }
              
                
                
            
                
                
                
                
                
//                .buttonStyle(WhiteTextTealBackgroundButton(width: UIScreen.main.bounds.width / 2, height: 60))
            }
           
        }
        
        //calling picker
        .sheet(isPresented: $picker){
            ImagePicker(images: $images, picker: $picker)
        
        }
        
    }
}

func goForGrabs() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ForGrabsView())
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
            NewForGrabsView()
        }
    }
}
