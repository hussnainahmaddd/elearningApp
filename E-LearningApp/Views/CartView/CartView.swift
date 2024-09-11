//
//  CartView.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI

struct CartView: View {
    
    @FetchRequest(
        entity: Cart.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Cart.courseName, ascending: true)]
    ) var items: FetchedResults<Cart>
    
    var body: some View {
        VStack{
            let totalPrice = items.reduce(0.0) { total, item in
                        let price = Double(item.price ?? "") ?? 0.0
                let quantity = Double(item.quantity ?? "") ?? 0.0 // assuming quantity is of type Int or Double
                        return total + (price * quantity)
                    }

                Spacer()
                    .frame(height: 20)
                HStack(alignment: .center, spacing: 2) {
                    CartTopView(
                        number: 0,
                        currentState: 1,
                        currentProgress: true)
                    Rectangle()
                        .frame(height: 1)
                        .padding(.top,-10)
                    CartTopView(
                        number: 1,
                        currentState: 1,
                        currentProgress:false)
                    Rectangle().frame(height: 1).padding(.top,-10)
                    CartTopView(
                        number: 2,
                        currentState: 2,
                        currentProgress: false)
                    Rectangle()
                        .frame(height: 1)
                        .padding(.top,-10)
                    CartTopView(
                        number: 3,
                        currentState: 3,
                        currentProgress: false)
                }
                .padding([.leading,.trailing],30)
                .frame(width: UIScreen.screenWidth)
                ScrollView{
                    VStack{
                        
                        ForEach(items, id: \.self) { value in
                            
                            if let imageData = value.courseImage{
                                if let uiImage = UIImage(data: imageData)
                                {
                                    
                                    CartCardView(orderPlaced: .constant(false), onClickFunc: {}, incrementClick: {
                                        
                                    }, decrementClick: {
                                        
                                        
                                        
                                        
                                    }, courseImage: .constant(uiImage), title: .constant(value.courseName ?? ""), quantity: Int(value.quantity ?? "") ?? 0, price: .constant(value.price ?? ""))
                                    
                                    
                                }}
                        }
                    }
                }
                
                VStack(alignment: .center) {
                    
                    HStack(alignment: .top) {
                        Text("Total Price")
                            .font(.subheadline)
                        Spacer()
                      
                        Text("\(totalPrice.formatted()) $")
                            
                        
                        .font(.subheadline)
                    } .padding(.bottom, 15)
                }
                .padding([.leading, .trailing], 15)
                .padding([.bottom], ((UIScreen.screenHeight > 800) ? 15: 0))
                
                ButtonPrimary(textLabel: "Continue", tagState: .defaulted){
                }
                .padding(.horizontal, 15)
                .ignoresSafeArea(.keyboard)

            }
            
        }
        
    }
    


#Preview {
    CartView()
}
