//
//  CartCardView.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI

struct CartCardView: View{
    
    var itemRowHeight = 130 as CGFloat
    @Binding var orderPlaced : Bool
    
    
    var onClickFunc: () -> Void
    var incrementClick : () -> Void
    var decrementClick : () -> Void
    @Binding var courseImage : UIImage
    @Binding var title : String
    @State var quantity : Int
    @Binding var price : String
    
    var body: some View {
        ZStack{
            Rectangle().fill(Color.white).frame(height: itemRowHeight).cornerRadius(8)
            HStack{
                ZStack{
                        
                            Image(uiImage: courseImage)
                                .resizable()
                                .frame(width: 40, height: 60)
                        
                    
                  
                        Rectangle()
                            .strokeBorder()
                            .frame(width: 65, height: 92)
                            .foregroundColor(.lightGreyColor)
                    
                }
                VStack(alignment: .leading){
                    Text(title)
                        .font(.headline)
                        .padding(.vertical, 2)
                    
                    
                    Spacer()
                    if orderPlaced
                    {
                        Spacer()
                    
                        Text("\(NSLocalizedString("Quantity", comment: "")) \(quantity) ").font(.subheadline)
                                .foregroundColor(.darkGreyColor)
                                .padding(.bottom, 2)

                    }
                    else
                    {
                        HStack{
                            Button(action: {
                                if quantity > 0
                                {
                                    self.quantity -= 1
                                }
                            }){
                                Image(.removeItemIcon)
                                    .resizable()
                                    .frame(width: 25,height: 25)
                                    .padding([.trailing],5)
                            }
                            Text("\(quantity)").font(.subheadline)
                            Button(action: {
                                self.quantity += 1
                            }){
                                Image(.addItemIcon)
                                    .resizable()
                                    .frame(width: 25,height: 25)
                                    .padding([.leading],5)
                            }
                        } .padding(.bottom, 1)
                    }
                }
                .frame(
                    height: 92,
                    alignment: .leading
                    
                )
                .padding([.leading], 10)
                Spacer()
                VStack(alignment: .trailing){
                   
                      
                        Spacer()
                    Text("\(price) $")
                            .font(.subheadline)
                            .bold()
                            .padding(.trailing, 8)
                        Text("Per Course")
                            .foregroundStyle(Color.darkGreyColor)
                            .font(.caption)
                            .padding(.trailing, 8)
                    
                  
                }
                .frame(height: 92)
                .padding(.trailing,5)
            }
            .padding(.all, 20)
            .frame(height: 140)
        }.padding([.leading,.trailing],15)
            
    }
}
