import SwiftUI

struct ProfileView: View {
    // MARK: - Color constants from Figma
    private let primary = Color(hex: 0x087F71)      // 主色青绿
    private let textDark = Color(hex: 0x173F38)     // 深色文字
    private let textSecondary = Color(hex: 0x697E79) // 次要文字
    private let cardBackground = Color.white
    private let pageBackground = Color(hex: 0xF4F8F7)
    private let membershipGold = Color(hex: 0x86652D)
    private let membershipBg = Color(hex: 0xF7ECD5)
    private let tabSelectedBg = Color(hex: 0xE4F4EF)

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                appHeader
                personalCard
                mottoText
                socialStats
                fishingCareerCard
                myContentCard
                exploreMoreCard
                membershipCard
                footerNote
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 24)
        }
        .background(pageBackground.ignoresSafeArea())
    }

    // MARK: - App Header
    private var appHeader: some View {
        HStack {
            Text("我的")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(textDark)
            Spacer()
            Text("设置")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(primary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
    }

    // MARK: - Personal Card (头像 + 资料)
    private var personalCard: some View {
        HStack(alignment: .center, spacing: 8) {
            // Avatar
            ZStack {
                Circle()
                    .fill(Color(hex: 0xE4F4EF))
                    .frame(width: 70, height: 70)
                Image(systemName: "person.fill")
                    .font(.system(size: 32, weight: .light))
                    .foregroundStyle(primary)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("溪边阿舟")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(textDark)
                Text("杭州 · 路亚爱好者")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(textSecondary)
                Button {
                    // 编辑资料 action
                } label: {
                    HStack(spacing: 0) {
                        Text("编辑资料")
                        Text("  ›")
                    }
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(primary)
                }
                .buttonStyle(.plain)
            }

            Spacer()

            Button {
                // 分享 action
            } label: {
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 21, weight: .regular))
                    .foregroundStyle(primary)
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Motto
    private var mottoText: some View {
        Text("把每次等待，都变成值得收藏的故事。")
            .font(.system(size: 12, weight: .regular))
            .foregroundStyle(textSecondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 4)
    }

    // MARK: - Social Stats
    private var socialStats: some View {
        HStack(spacing: 0) {
            statColumn(value: "86", label: "关注")
            Spacer()
            statColumn(value: "268", label: "粉丝")
            Spacer()
            statColumn(value: "1,024", label: "获赞")
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
    }

    private func statColumn(value: String, label: String) -> some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(textDark)
            Text(label)
                .font(.system(size: 11, weight: .regular))
                .foregroundStyle(textSecondary)
        }
    }

    // MARK: - Fishing Career Card
    private var fishingCareerCard: some View {
        cardBackground {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("我的钓鱼生涯")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(textDark)
                    Spacer()
                    Button {
                        // 统计洞察 action
                    } label: {
                        HStack(spacing: 0) {
                            Text("统计洞察")
                            Text(" ↗")
                        }
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(primary)
                    }
                    .buttonStyle(.plain)
                }

                HStack(spacing: 0) {
                    careerStat(value: "128", label: "累计渔获")
                    Spacer()
                    careerStat(value: "12", label: "鱼种收集")
                    Spacer()
                    careerStat(value: "3.6 kg", label: "最大记录")
                }
            }
            .padding(16)
        }
    }

    private func careerStat(value: String, label: String) -> some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(textDark)
            Text(label)
                .font(.system(size: 11, weight: .regular))
                .foregroundStyle(textSecondary)
        }
    }

    // MARK: - My Content Card
    private var myContentCard: some View {
        cardBackground {
            VStack(spacing: 0) {
                contentRow(icon: "mappin", title: "我的钓点", count: "18")
                contentRow(icon: "photo.on.rectangle", title: "我的渔获", count: "128")
                contentRow(icon: "bubble.left", title: "我的动态", count: "24")
                contentRow(icon: "heart", title: "我的收藏", count: "36", showDivider: false)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
        }
    }

    private func contentRow(icon: String, title: String, count: String, showDivider: Bool = true) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(textDark)
                .frame(width: 24)
            Text(title)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(textDark)
            Spacer()
            HStack(spacing: 0) {
                Text(count)
                Text("  ›")
            }
            .font(.system(size: 12, weight: .regular))
            .foregroundStyle(textSecondary)
        }
        .frame(height: 37)
        .overlay(alignment: .bottom) {
            if showDivider {
                Rectangle()
                    .fill(Color(hex: 0xE8EEEE))
                    .frame(height: 0.5)
            }
        }
    }

    // MARK: - Explore More Card
    private var exploreMoreCard: some View {
        cardBackground {
            VStack(spacing: 0) {
                exploreRow(title: "学习中心 / 鱼种图鉴", subtitle: "继续学习  ›")
                exploreRow(title: "我的装备", subtitle: "管理竿、轮、线、饵  ›")
                exploreRow(title: "通知与隐私设置", subtitle: "›", showDivider: false)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
        }
    }

    private func exploreRow(title: String, subtitle: String, showDivider: Bool = true) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(textDark)
            Spacer()
            Text(subtitle)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(textSecondary)
        }
        .frame(height: 37)
        .overlay(alignment: .bottom) {
            if showDivider {
                Rectangle()
                    .fill(Color(hex: 0xE8EEEE))
                    .frame(height: 0.5)
            }
        }
    }

    // MARK: - Membership Card
    private var membershipCard: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(membershipBg)
            .overlay(
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("钓迹 PRO")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundStyle(membershipGold)
                        Text("高级图层、延长预报 · 即将开放")
                            .font(.system(size: 11, weight: .regular))
                            .foregroundStyle(membershipGold)
                    }
                    Spacer()
                    Button {
                        // 了解权益 action
                    } label: {
                        Text("了解权益 ›")
                            .font(.system(size: 12, weight: .regular))
                    }
                    .foregroundStyle(membershipGold)
                    .buttonStyle(.plain)
                }
                .padding(16)
            )
            .frame(maxWidth: .infinity)
            .frame(height: 83)
    }

    // MARK: - Footer Note
    private var footerNote: some View {
        Text("私人航点默认私密 · 位置公开由你决定")
            .font(.system(size: 10, weight: .regular))
            .foregroundStyle(textSecondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 12)
    }

    // MARK: - Card Background Helper
    private func cardBackground<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(cardBackground)
            content()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview { ProfileView() }
