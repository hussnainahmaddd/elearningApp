//
//  CartTopView.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI

struct CartTopView: View {
    var number: Int
    var currentState: Int
    var textTitle: [Int: String] = [0: "Cart", 1: "Address", 2: "payment", 3: "Done",]
    var currentProgress: Bool
    
    var body: some View {
        
        if (number == currentState){
            VStack(alignment: .center){
                ZStack{
                    Circle().frame(width: 20,height: 20)
                    Text(String(number + 1))
                        .font(.subheadline)
                        .foregroundColor(.whiteColor)
                        .lineLimit(1)
                }.padding(2)
                Text(textTitle[number] ?? "")
                    .font(.caption)
                    .foregroundColor(.blackColor)
                    .lineLimit(1)
                    .frame(alignment: .center)
                    .scaledToFill()
            }
            
        }
        else{
            VStack(alignment: .center){
                ZStack{
                    Circle()
                        .strokeBorder()
                        .frame(width: 20,height: 20)
                        .foregroundColor(currentProgress ? .darkGreyColor : .greyColor)
                    if(!currentProgress){
                        Text(String(number + 1))
                            .font(.subheadline)
                            .foregroundColor(.greyColor)
                            .lineLimit(1)
                    }
                    else{
                        Image(.checkIcon)
                            .resizable()
                            .frame(width: 9, height: 5.4)
                    }
                }.padding(2)
                Text(textTitle[number] ?? "")
                    .font(.subheadline)
                    .foregroundColor(currentProgress ? .darkGreyColor : .greyColor)
                    .lineLimit(1)
                    .scaledToFill()
            }
        }
    }
}

#Preview {
    CartTopView(number: 0, currentState: 1, currentProgress: true)
}
