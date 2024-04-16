//
//  Home.swift
//  OrbitX
//
//  Created by Aakash  Bondwal  on 16/04/24.
//

import SwiftUI

struct Home: View {
    
    @StateObject private var vm = ArticlesViewModel(selectData: "articles")
    @State private var selectedData = "Articles"
    @State private var showMenu: Bool = false
    var body: some View {
        VStack {
            AnimatedSideBar(
                rotatesWhenExpands: true,
                disablesInteraction: true,
                sideMenuWidth: 200 ,
                cornerRadius: 25,
                showMenu: $showMenu
            ) { safeArea in
                NavigationStack {
                    ZStack {
                        
                        //main news feed
                        GeometryReader {
                            let size = $0.size
                            let safeArea = $0.safeAreaInsets
                            
                            NewsView(size: size, safeArea: safeArea, title: selectedData)
                                .ignoresSafeArea(.container, edges: .all)
                                .environmentObject(vm)
                        }
                        
                        VStack {
                            
                            HStack {
                                Button(action: {
                                    showMenu.toggle()
                                }
                                       , label: {
                                    Image(systemName: showMenu ? "xmark" : "line.3.horizontal")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .contentTransition(.symbolEffect)
                                })
                                .foregroundStyle(.white)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                        }
                    }
                }
            } menuView: { safeArea in
                //side menu ui
                VStack(alignment: .leading, spacing: 12) {
                    Text("Menu")
                        .font(.largeTitle.bold())
                    
                    
                    Button(action: {
                        
                        selectedData = "Articles"
                        vm.updateData(for: "articles")
                        
                        
                        
                        showMenu.toggle()
                        
                    }, label: {
                        Text("Articles")
                            .padding()
                            .background(Color(.systemGray6))
                            .frame(maxWidth: .infinity)
                            .cornerRadius(20)
                        
                    })
                    
                    Button(action: {
                        
                        
                        vm.updateData(for: "blogs")
                        
                        selectedData = "Blogs"
                        
                        showMenu.toggle()
                        
                    }, label: {
                        Text("Blogs")
                            .padding()
                            .background(Color(.systemGray6))
                            .frame(maxWidth: .infinity)
                            .cornerRadius(20)
                        
                    })
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 20)
                .padding(.top, safeArea.top)
                .padding(.bottom, safeArea.bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            } background: {
                Rectangle()
                    .fill(.black)
            }
            
        }
        
    }
    
}

#Preview {
    Home()
}
