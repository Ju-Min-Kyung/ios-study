//
//  ContentsItem.swift
//  koreatechgram
//
//  Created by JOOMINKYUNG on 2023/04/14.
//

import SwiftUI

struct ContentsItem: View {
    @State var isLiked : Bool = false
    @State var isBookmarkFilled: Bool = false
    
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
                .resizable().scaledToFit().aspectRatio(1, contentMode: .fit)
            
            HStack(spacing: 0){
                HStack(spacing: 16){
                    Button(action:{
                        isLiked = !isLiked
                    }){
                        Image(systemName: isLiked ? "heart.fill": "heart").resizable().frame(width: 20, height: 20)
                    
                    }
                    
                    Image(systemName: "message").resizable().frame(width: 20, height: 20)
                    Image(systemName: "location").resizable().frame(width: 20, height: 20)
                }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 16)
                
                Button(action:{
                    isBookmarkFilled.toggle()
                }){
                    Image(systemName: "bookmark").resizable().frame(width: 20, height: 20, alignment: .trailing).padding(16)
                }
                
            }
            
        }
    }
}

struct ContentsItem_Previews: PreviewProvider {
    static var previews: some View {
        ContentsItem()
    }
}
