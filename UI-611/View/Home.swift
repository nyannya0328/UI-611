//
//  Home.swift
//  UI-611
//
//  Created by nyannyan0328 on 2022/07/14.
//

import SwiftUI

struct Home: View {
    @StateObject var model : MortionManeger = .init()
    var body: some View {
        VStack{
            
            
            HStack{

                
                Button {
                    
                } label: {
                    
                    Image(systemName: "line.horizontal.3")
                        .font(.title3)
                }

                
                Spacer()
                
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "person")
                        .font(.title3)
                }
                

                
                
            }
            .foregroundColor(.white)
            
            
            Text("Exclusicve tips just for you")
                .font(.custom("GabrielaStencilW00-Lightit", size: 25))
                .foregroundColor(.white)
                .padding(.vertical,10)
            
            
            ParaxCardView()
            
            TabBar()
            
            
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background{
            
            Color("BG").ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func ParaxCardView()->some View{
        
        TabView{
            
            ForEach(sample_places){place in
                
                GeometryReader{proxy in
                    
                     let size = proxy.size
                    
                    ZStack{
                        
                        Image(place.bgName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x:model.currentSlider.id == place.id ? -model.xValue * 75 : 0)
                            .frame(width: size.width,height: size.height)
                            
                            
                        
                        Image(place.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x:model.currentSlider.id == place.id ? ovelay() : 0)
                            .frame(width: size.width,height: size.height)
                            .scaleEffect(1.05,anchor: .bottom)
                        
                        
                        VStack(spacing:10){
                            
                            
                            Text("FEATURES")
                                .font(.caption.bold())
                                .foregroundColor(.white)
                            
                            
                            Text(place.placeName)
                                .font(.custom("GabrielaStencilW00-Lightlt", size: 20))
                                .foregroundColor(.white)
                                .shadow(color:.black.opacity(0.2), radius: 10,x: 5,y: 5)
                                .shadow(color:.black.opacity(0.2), radius: 10,x: -5,y: -5)
                            
                            
                        
                            
                            Button {
                                
                            } label: {
                                
                                Text("EXPLORE")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.vertical,15)
                                    .padding(.horizontal,30)
                                    .background{
                                     
                                     Rectangle()
                                            .fill(.gray.opacity(0.3))
                                        
                                        Rectangle()
                                               .fill(.red.opacity(0.3))
                                    }
                                    .cornerRadius(10)
                            }

                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
                        .padding(.top,60)
                        
                     
                        
                    }
                    .frame(width: size.width,height: size.height)
                    .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                }
                .padding(.horizontal)
                .padding(.vertical)
               
                
            }
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onAppear{model.detectMoriton()}
        .onDisappear{model.stop()}
        
    }
    func ovelay()->CGFloat{
        
        let offset = model.xValue * 7
        
        
        if offset > 0{
            
            return offset > 8 ? 8 : offset
        }
        return -offset > 8 ? -8 : offset
        
        
        
    }
    @ViewBuilder
    func TabBar()->some View{
        
        HStack(spacing:0){
            
            
            ForEach(["house","suit.heart","magnifyingglass"],id:\.self){syi in
                
                Image(systemName: syi)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .center)
                
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
