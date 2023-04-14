//
//  ContentView.swift
//  koreatechgram
//
//  Created by JOOMINKYUNG on 2023/03/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        ScrollView{
            ForEach(0...20, id: \.self){ index in
                ContentsItem()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

