//
//  PicturePicker.swift
//  Getting Started
//
//  Created by Gagana Ananda on 11/27/24.
//

import PhotosUI
import SwiftUI

struct PicturePicker: View {
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @Binding var selectedData: Data?

    var body: some View {
        VStack {
            if let selectedData, let image = UIImage(data: selectedData) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            }

            PhotosPicker(selection: $selectedPhoto) {
                Text(selectedPhoto == nil ? "Choose a picture" : "Change picture")
            }
        }
        .onChange(of: selectedPhoto) { newValue in
            Task {
                if let newPhoto = newValue {
                    do {
                        selectedData = try await newPhoto.loadTransferable(type: Data.self)
                    } catch {
                        print("Error loading photo: \(error)")
                    }
                }
            }
        }
    }
}
