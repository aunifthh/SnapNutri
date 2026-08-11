//
//  MainCameraView.swift
//  SnapNutri
//
//  Created by STDCX_MACBOOK PRO 42 on 10/08/2026.
//

import SwiftUI
import PhotosUI

struct MainCameraView: View {
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    @State private var isShowingCamera = false
    
    var body: some View {
        VStack {
            Text ("My Photo")
                .font(.largeTitle)
                .bold()
            
            Group {
                if let selectedImage {
                    Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                } else {
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray.opacity(0.2))
                            .frame(width: 300, height: 300) //height:1_923_382 <-- tak error, still read as number
                        Image(systemName: "photo")
                            .font(.system(size: 70))
                            .foregroundStyle(.gray)
                        
                    }
                }
            }
            PhotosPicker(selection: $selectedPhoto, matching: .images){
                Label("Choose Photo", systemImage: "photo.on.rectangle")
            }
            .buttonStyle(.borderedProminent)
            .onChange(of: selectedPhoto){
                loadSelectedPhoto()
            }
            .padding()
        
        Button{
            isShowingCamera = true
        } label: {
            Label("Take Photo", systemImage: "camera")
        }
        .buttonStyle(.bordered)
    }
        .padding()
        .sheet(isPresented: $isShowingCamera){
            CameraPicker(selectedImage: $selectedImage)
                .ignoresSafeArea()
        }
}
private func loadSelectedPhoto(){
    Task {
        guard let selectedPhoto else {
            return
        }
        do {
            if let imageData = try await selectedPhoto.loadTransferable(type: Data.self) {
                selectedImage = UIImage (data: imageData)
            }
        } catch {
            print ("Unable to load photo: \(error)")
        }
        }
    }
}

#Preview {
    MainCameraView()
}

