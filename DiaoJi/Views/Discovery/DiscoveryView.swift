import SwiftUI

struct DiscoveryView: View {
    private let ink = Color(hex: 0x173F38)
    private let green = Color(hex: 0x087F71)
    private let muted = Color(hex: 0x697E79)
    private let chips = ["天气水文", "新手课堂", "鱼种图鉴", "钓鱼法规"]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("杭州 · 西湖区").font(.system(size: 20, weight: .bold)).foregroundStyle(ink)
                Spacer()
                Text("切换城市⌄").font(.system(size: 13)).foregroundStyle(green)
            }
            .padding(.horizontal, 20).frame(height: 64)
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 14) {
                    weatherCard
                    HStack(spacing: 0) {
                        ForEach(chips, id: \.self) { chip in
                            Text(chip).font(.system(size: 11)).foregroundStyle(green)
                                .padding(.horizontal, 10).padding(.vertical, 6)
                                .background(Color(hex: 0xE8F4EF)).clipShape(RoundedRectangle(cornerRadius: 9))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    HStack {
                        Text("附近好钓点").font(.system(size: 18, weight: .bold)).foregroundStyle(ink)
                        Spacer()
                        Text("查看地图 ↗").font(.system(size: 12)).foregroundStyle(green)
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Image("DiscoverySpot").resizable().scaledToFill().frame(height: 128).frame(maxWidth: .infinity).clipped().clipShape(RoundedRectangle(cornerRadius: 16))
                        HStack {
                            Text("青山湖 · 柳湾钓点").font(.system(size: 17, weight: .bold)).foregroundStyle(ink)
                            Spacer()
                            Text("免费").font(.system(size: 11)).foregroundStyle(green).padding(.horizontal, 10).padding(.vertical, 6).background(Color(hex: 0xE8F4EF)).clipShape(RoundedRectangle(cornerRadius: 9))
                        }
                        Text("★ 4.8   ·   距你 3.2 km   ·   鲫鱼 / 鲈鱼").font(.system(size: 12)).foregroundStyle(muted)
                    }
                    HStack {
                        Text("钓友刚刚上鱼").font(.system(size: 18, weight: .bold)).foregroundStyle(ink)
                        Spacer()
                        Text("去社区 ↗").font(.system(size: 12)).foregroundStyle(green)
                    }
                    HStack(spacing: 8) {
                        Image("CommunityCatch").resizable().scaledToFill().frame(width: 88, height: 65).clipped().clipShape(RoundedRectangle(cornerRadius: 14))
                        VStack(alignment: .leading, spacing: 10) {
                            Text("第一尾秋日鲈鱼，顺利放流！").font(.system(size: 13, weight: .bold)).foregroundStyle(ink)
                            Text("溪边阿舟 · 28 分钟前").font(.system(size: 11)).foregroundStyle(muted)
                        }
                        Spacer(minLength: 0)
                    }
                    Text("界面内容为示例数据，仅供设计展示").font(.system(size: 10)).foregroundStyle(muted)
                }
                .padding(.horizontal, 20).padding(.top, 8).padding(.bottom, 16)
            }
        }
        .background(Color(hex: 0xF4F8F7))
    }

    private var weatherCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("今天，是出钓的好日子").font(.system(size: 16, weight: .bold))
                Spacer()
                Text("☀ 18°").font(.system(size: 20))
            }.foregroundStyle(.white)
            HStack(spacing: 16) {
                Text("86").font(.system(size: 66, weight: .bold)).foregroundStyle(.white)
                VStack(alignment: .leading, spacing: 8) {
                    Text("适钓指数 / 100").font(.system(size: 12)).foregroundStyle(Color(hex: 0xD3F1E8))
                    Text("非常适宜").font(.system(size: 20, weight: .bold)).foregroundStyle(.white)
                    Text("东南风 2级 · 气压稳定").font(.system(size: 11)).foregroundStyle(Color(hex: 0xD3F1E8))
                }
            }
            HStack {
                Text("黄金时段  06:00–09:00").font(.system(size: 13, weight: .bold))
                Spacer()
                Text("详情 ↗").font(.system(size: 12))
            }.foregroundStyle(.white).padding(.top, 8)
        }
        .padding(16)
        .background(LinearGradient(colors: [Color(hex: 0x086E68), Color(hex: 0x179D91)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
