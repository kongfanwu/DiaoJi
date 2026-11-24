import SwiftUI

struct TabBarView: View {
    @Binding var selection: AppTab
    private let active = Color(hex: 0x087F71)
    private let inactive = Color(hex: 0x697E79)

    var body: some View {
        HStack(spacing: 0) {
            ForEach(AppTab.allCases) { tab in
                Button { selection = tab } label: {
                    VStack(spacing: 5) {
                        Image(selection == tab ? tab.selectedIconName : tab.normalIconName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        Text(tab.rawValue)
                            .font(.system(size: 11))
                    }
                    .foregroundStyle(selection == tab ? active : inactive)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(selection == tab ? Color(hex: 0xE4F4EF) : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .accessibilityLabel(tab.rawValue)
                .accessibilityAddTraits(selection == tab ? .isSelected : [])
            }
        }
        .padding(.horizontal, 20)
        .frame(height: 60)
        .background(.white)
    }
}
