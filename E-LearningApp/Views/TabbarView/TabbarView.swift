//
//  TabbarView.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI


struct TabBarView: View {
    @State var playerFrame = CGRect.zero
    @State var tabSelection : Int
    @State private var selectedCategory = false
    @State private var inputImage: UIImage?
 
    
    @State private var safeAreaBottomInset: CGFloat = 0
    @State private var bottomPadding: CGFloat = 10

    
    var body: some View {
        
        //MARK: Tabbar View Starts from Here
        ZStack {
            Color.greyFiveColor
            TabView(selection: $tabSelection) {
                //MARK: ZStack View Starts from Here
                
                ZStack {
                    //MARK: VStack View Starts from Here
                    VStack(spacing: 0) {
                     HomeView()
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 10)
                            .background(Color.whiteColor)
                    }
                }
                .tabItem {
                    tabSelection == 1 ? Image("HomeIcon").renderingMode(.template) : Image("HomeIcon")
                    Text("")
                }
                .tag(1)
                
                //MARK: ZStack View Starts from Here
                ZStack {
                    //MARK: VStack View Starts from Here
                    VStack(spacing: 0) {
                        CartView()
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 10)
                            .background(Color.whiteColor)
                    }
                }
                .tabItem {
                    tabSelection == 2 ? Image("CartIcon").renderingMode(.template) :  Image("CartIcon")
                    Text("")
                }
                .tag(2)
                
               
               
                
            }
            .navigationBarHidden(true)
            .background(Color.screenBackground.ignoresSafeArea(edges: .bottom))
            .accentColor(.blackColor)
          
            .onAppear {
                // removes the tabbar opaque borders, its now transparent
                UITabBar.appearance().backgroundImage = UIImage()
                UITabBar.appearance().shadowImage = UIImage()
                
            }
            

        }
        .padding(.bottom, bottomPadding)
        .background(Color.whiteColor)
        .accentColor(Color.blackColor)
        .navigationBarHidden(true)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(tabSelection: 1)
    }
}
