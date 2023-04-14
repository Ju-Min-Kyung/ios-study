//
//  ContentView.swift
//  koreatechgram
//
//  Created by JOOMINKYUNG on 2023/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0){
                Image("profileImage")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    
                
                //spacer
    
                Text("alsrud76")
                    .foregroundColor(.blue)
                    .font(.callout)
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
            /*
                .padding(.leading, 16) // 기본값: 16
                .padding(.trailing, 16) // horizontal로 쓸 수 있음*/
            
                
            Image("profileImage")
                .resizable().aspectRatio(1, contentMode: .fit)
            
            HStack(spacing: 0){
                
                HStack(spacing: 8){
                    Image(systemName: "heart").resizable().frame(width: 20, height: 20)
                    Image(systemName: "message")
                        .resizable().frame(width: 20, height: 20)
                    Image(systemName: "location").resizable().frame(width: 20, height: 20)
                    
                }.frame(maxWidth: .infinity, alignment: .leading).padding(16)
                
                Image(systemName: "bookmark").resizable().frame(width: 20, height: 20, alignment: .trailing).padding(16)
                //과제
                //4개의 아이콘, 3개는 왼쪽, 1개는 오른쪽
                //양쪽에 16씩 padding, icon 사이마다 8씩 패딩 넣기 - for문..?
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

