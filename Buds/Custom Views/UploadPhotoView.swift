//
//  UploadPhotoView.swift
//  Buds
//
//  Created by Andrea Wang Admin on 8/5/21.
//

import SwiftUI
import PhotosUI

struct UploadPhotoView: View {
    
    @State var images: [UIImage] = []
    @State var picker = false
    
    var body: some View {
        VStack{
            if !images.isEmpty{
                ScrollView(.horizontal, showsIndicators: false, content:{
                    HStack(spacing: 15){
                        ForEach(images, id: \.self){ img in
                            
                            Image(uiImage: img)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width - 45, height: 250)
                                .cornerRadius(20)
                            
                        }
                    }
                })
            }
            else{
                
//                Button(action:{
//                    picker.toggle()
//                }, label: {
//                    Text("Upload Image")
//                        .buttonStyle(WhiteTextTealBackgroundButton(width: 300, height: 100))
//                    })
                
                Button(action:{
                    picker.toggle()


                }, label: {
                    Text("Upload Images")
                        .buttonStyle(WhiteTextTealBackgroundButton(width: 300, height: 100))
//                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 35)
                        .background(Color.blue)
                        .clipShape(Capsule())


                })
            }
        }
        
        //calling picker
        .sheet(isPresented: $picker){
            ImagePicker(images: $images, picker: $picker)
        }
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
        UploadPhotoView()
    }
}
