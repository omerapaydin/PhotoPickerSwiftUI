//
//  ContentView.swift
//  PhotoPickerSwiftUI
//
//  Created by Ömer on 4.01.2025.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State var selectedItem : [PhotosPickerItem] = []
    @State var data : Data?
    
    
    var body: some View {
        VStack {
           
            PhotosPicker(selection: $selectedItem,maxSelectionCount: 1,matching: .images ){
                Text("Selected")
            }.onChange(of: selectedItem) { newValue in
                guard let item = selectedItem.first else { return }
                
                item.loadTransferable(type: Data.self) { Result in
                    switch Result {
                    case .success(let data):
                        self.data = data
                    case .failure(let error):
                        print(error)
                    }
                    
                }
            }
            
            
        }
    
    }
}

#Preview {
    ContentView()
}
