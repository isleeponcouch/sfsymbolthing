import SwiftUI

struct ContentView: View {
    @State private var variableValue = 0.0
    @State private var animate = 0
    @State private var appearIsHidden = true
    @State private var disappearIsHidden = false
    @State private var scaleUp = false
    @State private var scaleDown = false
    @State private var replace = false
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            TabView {
                
                // MARK: Rendering Modes
                
                exampleCard(title: "Rendering Modes", subtitle: "Monochrome") {
                    Image(systemName: "sailboat")
                        .symbolRenderingMode(.monochrome)
                        .font(.system(size: 120))
                }
                exampleCard(title: "Rendering Modes", subtitle: "Hierarchical") {
                    Image(systemName: "airplane.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                        .font(.system(size: 120))
                }
                exampleCard(title: "Rendering Modes", subtitle: "Multicolour") {
                    Image(systemName: "paintpalette")
                        .renderingMode(.original)
                        .font(.system(size: 120))
                }
                exampleCard(title: "Rendering Modes", subtitle: "Palette") {
                    Image(systemName: "cloud.bolt.rain.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.gray.gradient, .blue)
                        .font(.system(size: 120))
                }
                
                // MARK: Variable Colour
                
                exampleCard(title: "Variable Colours", subtitle: "All Rendering Modes") {
                    Image(systemName: "speaker.wave.3.fill", variableValue: variableValue)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.teal.gradient, .cyan)
                        .font(.system(size: 120))
                    Slider(value: $variableValue, in: 0...1)
                }
                
                // MARK: Animations
                
                exampleCard(title: "Animations", subtitle: "Bounce") {
                    Image(systemName: "microbe")
                        .symbolRenderingMode(.palette)
                        .symbolEffect(.bounce, value: animate)
                        .foregroundStyle(.red.gradient, .cyan)
                        .font(.system(size: 120))
                    Button("Bounce") {
                        animate += 1
                    }
                    .buttonStyle(.bordered)
                }
                exampleCard(title: "Animations", subtitle: "Pulse") {
                    Image(systemName: "exclamationmark.brakesignal")
                        .symbolRenderingMode(.palette)
                        .symbolEffect(.pulse, value: animate)
                        .foregroundStyle(.green.gradient, .cyan)
                        .font(.system(size: 120))
                    Button("Pulse") {
                        animate += 1
                    }
                    .buttonStyle(.bordered)
                }
                exampleCard(title: "Animations", subtitle: "Variable Colour") {
                    Image(systemName: "wifi")
                        .symbolRenderingMode(.palette)
                        .symbolEffect(.variableColor, value: animate)
                        .foregroundStyle(.purple.gradient, .cyan)
                        .font(.system(size: 120))
                    Button("Variable Colour") {
                        animate += 1
                    }
                    .buttonStyle(.bordered)
                }
                exampleCard(title: "Animations", subtitle: "Appear") {
                    Image(systemName: "soccerball")
                        .symbolRenderingMode(.palette)
                        .symbolEffect(.appear, isActive: appearIsHidden)
                        .foregroundStyle(.orange.gradient, .cyan)
                        .font(.system(size: 120))
                    Button("Appear") {
                        appearIsHidden.toggle()
                    }
                    .buttonStyle(.bordered)
                }
                exampleCard(title: "Animations", subtitle: "Disappear") {
                    Image(systemName: "gamecontroller.fill")
                        .symbolRenderingMode(.palette)
                        .symbolEffect(.disappear, isActive: disappearIsHidden)
                        .foregroundStyle(.green.gradient, .cyan)
                        .font(.system(size: 120))
                    Button("Disappear") {
                        disappearIsHidden.toggle()
                    }
                    .buttonStyle(.bordered)
                }
                exampleCard(title: "Animations", subtitle: "Scale (Up)") {
                    Image(systemName: "macpro.gen3.fill")
                        .symbolRenderingMode(.palette)
                        .symbolEffect(.scale.up, isActive: scaleUp)
                        .foregroundStyle(.gray.gradient, .cyan)
                        .font(.system(size: 120))
                    Button("Scale down") {
                        scaleUp.toggle()
                    }
                    .buttonStyle(.bordered)
                }
                exampleCard(title: "Animations", subtitle: "Scale (Down)") {
                    Image(systemName: "desktopcomputer")
                        .symbolRenderingMode(.palette)
                        .symbolEffect(.scale.down, isActive: scaleDown)
                        .foregroundStyle(.gray.gradient, .black.gradient)
                        .font(.system(size: 120))
                    Button("Scale up") {
                        scaleDown.toggle()
                    }
                    .buttonStyle(.bordered)
                }
                
                // MARK: Replace
                
                exampleCard(title: "Animations", subtitle: "Replace") {
                    Image(systemName: replace ? "wifi" : "wifi.slash")
                        .symbolRenderingMode(.palette)
                        .contentTransition(.symbolEffect(.replace))
                        .foregroundStyle(.blue.gradient, .red.gradient)
                        .font(.system(size: 120))
                    Button("Replace") {
                        replace.toggle()
                    }
                    .buttonStyle(.bordered)
                }

            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        .tint(.teal)
    }
    
    @ViewBuilder
    private func exampleCard<Content: View>(title: String, subtitle: String, @ViewBuilder content: @escaping () -> Content) -> some View {
        VStack(spacing: 20) {
            Text(title).font(.largeTitle.bold())
            Text(subtitle).font(.title.bold())
            content()
        }
        .frame(maxWidth: 280, maxHeight: 340)
        .padding(20)
        .background(in: RoundedRectangle(cornerRadius: 20))
        .backgroundStyle(.ultraThickMaterial)
    }
}

#Preview {
    ContentView()
}
