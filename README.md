## iOS programming - 1인 기말 프로젝트
![image](https://github.com/user-attachments/assets/7f7434d3-8a02-43a5-aa5b-9b59f0ab6de2)

# BuggiMate - 캠퍼스 라이프 도우미 앱

**BuggiMate**는 대학생을 위한 **SwiftUI** 기반의 iOS 전용 앱으로, 학업과 일상 관리를 효율적으로 도와주는 통합 플랫폼입니다. 시간표, 할 일 목록, 학교 공지사항, 학식 정보 등 분산된 캠퍼스 생활 정보를 하나의 앱에서 확인하고 관리할 수 있도록 지원합니다.

---

## 1. 📄 기획 배경

현대 대학생들은 다양한 플랫폼에서 분산된 정보를 관리하며 학업과 일상생활을 병행하고 있습니다.  
시간표, 할 일 목록, 학교 공지사항, 학식 정보 등 필수적인 캠퍼스 생활 정보가 각각 다른 앱이나 웹사이트에 흩어져 있어, 이를 하나의 통합된 환경에서 확인하려는 수요가 점점 증가하고 있습니다.  
이에 따라 사용자 경험(UX)을 개선하고, 학습 효율 및 시간 관리 능력을 향상시킬 수 있는 통합 플랫폼의 필요성이 대두되고 있습니다.

---

## 2. 📱 서비스 소개

**BuggiMate**는 **SwiftUI** 기반으로 개발된 **iOS** 전용 스마트 캠퍼스 라이프 도우미 앱입니다.  
대학생들이 자주 사용하는 기능들을 통합하여 제공하며, 학업 및 일상 관리를 보다 효율적으로 지원합니다.  
사용자는 별도의 서버 없이, **로컬 저장(UserDefaults)**을 통해 자신의 일정, 수업 시간표, 학교 소식, 학식/도서관 정보 등을 빠르게 확인하고 관리할 수 있습니다.

---

## 3. 🖥️ 서비스 구조

**BuggiMate**는 클라이언트 단독으로 운영되는 iOS 앱으로, SwiftUI를 기반으로 합니다.

### 3.1. 메인 구조
- **HomeView**: 주간 일정 및 중요 공지 요약 카드 제공
- **TimeTableView**: 요일별 수업 등록 및 메모 기능
- **CalendarView**: 월간/주간 일정 확인 및 할 일 등록/완료
- **InfoView**: 학식, 도서관 정보 카드 형식 제공
- **ChatBotView**: 학교 생활 관련 팁 및 간단한 자동 응답형 챗봇 제공
- **MyPageView**: 설정, 사용자 정보, 앱 리뷰 기능 포함

### 3.2. 기술 스택
- **프론트엔드**: SwiftUI
- **아키텍처**: MVVM 패턴 적용 + Clean 아키텍쳐
- **저장 방식**: UserDefaults 기반 로컬 저장소
- **UI 요소**: Grid, List, ScrollView, TabView 등 활용

---

## 4. 📊 비즈니스 모델

현재 **BuggiMate**는 개인 학습 및 실습 목적의 단독 클라이언트 앱으로 운영되며, 향후 발전 방향으로는 다음과 같은 비즈니스 모델 전개가 가능합니다.

### 4.1. B2C 확장형 모델
추후 서버 및 데이터베이스 연동 기능을 추가하여 사용자 간 정보 공유, 커뮤니티 기능 등을 탑재함으로써,  
앱스토어 유료 다운로드 또는 인앱 결제 기반 수익 모델로 확장 가능합니다.

### 4.2. 학교 제휴형 모델
국내 대학과의 협업을 통해 학내 공식 일정 및 공지사항을 자동 연동하는 **B2B** 방식으로 발전 가능,  
학교 브랜드화된 전용 앱 개발로 계약형 수익 구조를 확보할 수 있습니다.

### 4.3. 광고 및 제휴 서비스 연동
학생 맞춤 광고(예: 학습자료, 서적, 주변 상권) 및 제휴 서비스(예: 배달, 도서 구매 등) 연계를 통한 수익 창출이 가능합니다.

---

### 5. ⚙️ IA
![image](https://github.com/user-attachments/assets/5f85c2c7-5ada-4e6a-be2c-97b7181904e4)


### 6. 📔 Convention
[💻 Code Convention](https://sopt-official.notion.site/codeConvention-1ee1e48dd960802b9709edcbe2244515)<br>
[📝 Branch Convention + Issue Convention](https://sopt-official.notion.site/branchConvention-issueConvention-1ee1e48dd960806caf13f98eaa107903)<br>
[👀 PR Convention](https://sopt-official.notion.site/pullRequestConvention-1ee1e48dd9608040a86cdc3e783ee7f5)<br>
[👀 Commit Convention](https://sopt-official.notion.site/commitConvention-1ee1e48dd9608085955fce4f5ec0af24)<br>

### 7. 시연영상
<table>
  <tr>
    <td width="25%"><img src="https://github.com/user-attachments/assets/11b357a5-e5a7-49b0-b9aa-fc35e13eeabd" width="100%" /></td>
    <td width="25%"><img src="https://github.com/user-attachments/assets/7a063aa0-7d55-47ad-b4c6-5c7d5d7f445e" width="100%" /></td>
    <td width="25%"><img src="https://github.com/user-attachments/assets/ea96653c-70d7-47c1-b26c-4f77d8111443" width="100%" /></td>
    <td width="25%"><img src="https://github.com/user-attachments/assets/ab697270-2704-4696-a489-bd64beb73227" width="100%" /></td>
  </tr>
  <tr>
    <td align="center"><b>스플래시+로그인</b></td>
    <td align="center"><b>홈+출석</b></td>
    <td align="center"><b>일정(일간)</b></td>
    <td align="center"><b>일정(월간)</b></td>
  </tr>
</table>
<table>
  <tr>
    <td width="25%"><img src="https://github.com/user-attachments/assets/41ece110-25a4-45a4-bd17-ef2934784dfa" width="100%" /></td>
    <td width="25%"><img src="https://github.com/user-attachments/assets/76d76fc0-2adb-4e3b-af59-d909edcbb0fa" width="100%" /></td>
    <td width="25%"><img src="https://github.com/user-attachments/assets/cb04465d-e464-4b43-a667-7cc4d1759ecb" width="100%" /></td>
    <td width="25%"><img src="https://github.com/user-attachments/assets/4d2e89b7-a05d-40ff-9ddc-affdcf906e55" width="100%" /></td>
  </tr>
  <tr>
    <td align="center"><b>정보</b></td>
    <td align="center"><b>챗봇</b></td>
    <td align="center"><b>마이페이지</b></td>
    <td align="center"><b>회원가입</b></td>
  </tr>
</table>




### 8. 발표영상
