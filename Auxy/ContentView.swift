//
//  ContentView.swift
//  Auxy
//
//  Created by Chaira Harder on 6/18/25.
//

/* MOCK AI DJ MIXER FEATURE*/

/* Royalty-free music sourced from: https://pixabay.com/service/terms/ */

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0
    
    @State private var animateGlow = false
    
    // TODO: there is a much better way to do this... with an enum I think. Lemme come back.
    @State private var showAuxy = false
    
    let auxyDark = Color(red: 23/255, green: 23/255, blue: 23/255, opacity: 0.9)
    let auxyLight = Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 1)
    let auxyGreen = Color(red: 41/255, green: 255/255, blue: 98/255, opacity: 1)


    var body: some View {
        VStack(spacing: 0) {
            
            // Top nav bar
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .foregroundStyle(auxyLight)
                Spacer()
            }
            .padding()
            .background(auxyDark)
            
            Spacer()
            
            Text("Auxy by Chaira")
                .padding(.bottom, 10)
                .foregroundStyle(auxyLight)
                .font(.title2)
                .fontWeight(.semibold)

            // Original middle auxy button
//            Button(action: {
//                showAuxy = true
//            }) {
//                ZStack {
//                    Circle()
//                        .fill(auxyGreen)
//                        .frame(width: 100, height: 100)
//                    Image(systemName: "music.note.list")
//                        .foregroundStyle(auxyDark)
//                        .font(.system(size: 30))
//                }
//            }
//            .padding()
            
            // Pulsing auxy middle button
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.4))
                    .frame(width: 120, height: 120)
                    .scaleEffect(animateGlow ? 1.2 : 1.0)
                    .opacity(animateGlow ? 0.5 : 0.1)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animateGlow)

                Button(action: {
                    showAuxy = true
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 100, height: 100)
                        Image(systemName: "music.note.list")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                }
            }
            .padding()
            .onAppear {
                animateGlow = true
            }

            

            Spacer()
            
            // Bottom menu bar
            HStack {
                Spacer()
                Button(action: { selection = 0 }) {
                    VStack {
                        Image(systemName: "house")
                        Text("Home").font(.caption)
                    }
                }
                Spacer()
                Button(action: { selection = 1 }) {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search").font(.caption)
                    }
                }
                Spacer()
                Button(action: { selection = 2 }) {
                    VStack {
                        Image(systemName: "books.vertical.fill")
                        Text("Library").font(.caption)
                    }
                }
                Spacer()
                Button(action: { selection = 3 }) {
                    VStack {
                        Image(systemName: "plus")
                        Text("Create").font(.caption)
                    }
                }
                Spacer()
            }
            .padding(.vertical, 10)
            .background(auxyDark)
            .tint(Color(UIColor.systemGray6))
        }
        .sheet(isPresented: $showAuxy) {
            AuxyView()
        }
        .background(auxyDark)
    }
}

struct AuxyView: View {
    var body: some View {
        VStack {
            Text("Auxy's Up")
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
            
            Text("Welcome back to college!")
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
