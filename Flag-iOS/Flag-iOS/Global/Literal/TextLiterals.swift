//
//  TextLiterals.swift
//  Flag-iOS
//
//  Created by 최지우 on 2023/07/14.
//

import UIKit

enum TextLiterals {
    
    // MARK: tabBar
    
    static let flag: String = "플래그"
    static let flagPlus: String = "약속잡기"
    static let myPage: String = "마이페이지"
    
    // MARK: Onboarding
    
    static let signIn: String = "로그인"
    static let signUp: String = "회원가입"
    static let inputEmailText: String = "이메일을 입력해 주세요"
    static let inputPasswordText: String = "비밀번호를 입력해 주세요"
    static let signUpTitleText: String = "FLAG 가입하기"
    static let resetPassword: String = "비밀번호 재설정"
    static let doubleCheckPasswordText: String = "비밀번호 확인"
    static let emailHintText: String = "ex) abc123@email.com"
    static let passwordHintText: String = "영문+숫자 조합 8자 이상"
    static let nextText: String = "다음"
    static let nicknameText: String = "닉네임"
    static let nicknameHintText: String = "닉네임 최소 2자 ~ 최대 5자"
    static let completeOnboardingText: String = "가입 완료하기"
    static let signUpAlertText: String = "안녕하세요 FLAG 입니다!\n가입 정보를 기입해 주세요."
    static let doubleCheck: String = "중복확인"
    
    // MARK: FlagPlus
    
    static let flagNameText: String = "약속 이름을 정해 주세요."
    static let flagNameHintText: String = "최대 15자"
    static let flagFriendsText: String = "누구와 잡는 약속인가요?"
    static let flagFriendsHintText: String = "🔍 검색"
    static let flagDateText: String = "날짜를 선택해 주세요. (최대 5일 선택 가능)"
    static let flagTimeText: String = "약속 시간대를 설정해 주세요"
    static let flagMinimumTimeText: String = "약속 최소 시간을 설정해 주세요"
    static let flagMinimumTimeHintText: String = "최소__시간은 만나야 해요"
    static let flagLocationText: String = "약속 장소를 입력해 주세요"
    static let flagMemoText: String = "약속 메모를 입력해 주세요"
    static let flagTimeScrollText: String = "가능한 시간을 스크롤해서 입력해주세요"
    static let flagTimePickText: String = "시간대를 골라 주세요!"
    static let flagTipText: String = "Tip:무더운 여름엔 오후에 약속을 잡는건 어때요?"
    static let flagMorningText: String = "오전(06:00~11:59)"
    static let flagMorningImage: String = "🌅 오전"
    static let flagAfternoonText: String = "오후(12:00~17:59)"
    static let flagAfternoonImage: String = "🌞 오후"
    static let flagDinnerText: String = "저녁(18:00~23:59)"
    static let flagDinnerImage: String = "🌙 저녁"
    static let flagDawnText: String = "새벽(00:00~05:59)"
    static let flagDawnImage: String = "🌚 새벽"
    static let flagDirectInput: String = "직접입력"
    static let flagDirectInputHint: String = "직접 시간을 입력해주세요.ex)13"
    static let flagConfirmText: String = "확인"
    static let flagCancelText: String = "취소"
    static let flagPossibleList: String = "가능한 일정 목록이에요!\n약속을 확정해 주세요."
    static let flagMinTimeOne: String = "최소 1시간"
    static let flagMinTimeTextOne: String = "최소 1시간은 만나야 해요"
    static let flagMinTimeTwo: String = "최소 2시간"
    static let flagMinTimeTextTwo: String = "최소 2시간은 만나야 해요"
    static let flagMinTimeThree: String = "최소 3시간"
    static let flagMinTimeTextThree: String = "최소 3시간은 만나야 해요"
    static let flagMinTimeFour: String = "최소 4시간"
    static let flagMinTimeTextFour: String = "최소 4시간은 만나야 해요"
    static let flagMinTimeFive: String = "최소 5시간"
    static let flagMinTimeTextFive: String = "최소 5시간은 만나야 해요"
    static let flagMinTimeSix: String = "최소 6시간"
    static let flagMinTimeTextSix: String = "최소 6시간은 만나야 해요"
    static let flagReadyText: String = "모든 준비가 완료되었어요!\n친구들에게 약속 신청 알림을 보낼까요?"
    static let flagAlarmText: String = "알림 보내기"
    static let flagOptionText: String = "선택 사항입니다."
    static let flagPassText: String  = "건너뛰기"


   
    // MARK: Flag
    
    static let flagRawValue: String = "FLAG"
    static let confirmedFlag: String = "확정된 약속"
    static let progressFlag: String = "진행 중인 약속"
    static let flagConfirmedText: String = "약속 확정하기"
    static let flagFriendDisplayText: String = "시간대를 클릭하여 가능한 친구들을\n확인해 보세요!"
    static let flagAcceptUsersText: String = "현재 약속을 수락한 친구들"
    static let flagNonResponseUsersText: String = "아직 응답이 없는 친구들"
    
    
    //MARK: MyPage
    
    static let searchText: String = "검색"
    static let DeleteQuestionText: String = "님을 친구 삭제하시겠습니까?"
    static let friendDeleteText: String = "친구삭제"
    static let deleteText: String = "삭제"
    static let newNicknameText: String = "새로운 닉네임을 입력해 주세요."
    static let newNicknameTextHint: String = "닉네임 최소 2자 ~ 최대 7자"
    static let completeText: String = "완료"
    static let signOutText: String = "로그아웃 하시겠습니까?"
    static let yesText: String = "예"
    static let noText: String = "아니오"
    static let askFriendPlusText: String = "친구추가하시겠습니까?"
    static let friendPlusText: String = "추가하기"
    static let friendListText: String = "친구목록"
    static let addFriendText: String = "친구추가"
    static let termsText: String = """
    “FLAG” 이용약관
    제1장 총칙
    제1조 목적
    이 약관은 팀 NAMA(이하 “나마”라 합니다)가 모바일 기기를 통해 제공하는 “FLAG”(이하 “서비스”라 합니다)의 이용에 대한 나마와 서비스 이용자의 권리ㆍ의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
    제2조 용어의 정의
    이 약관에서 사용하는 용어는 다음과 같습니다.
    “나마”라 함은 “FLAG”를 제작하고 서비스를 제공하는 자를 말합니다.
    “이용자”라 함은 “FLAG”의 웹페이지 또는 어플리케이션에 접속하여 이 약관에 따라 FLAG가 제공하는 서비스를 이용하는 자를 말합니다.
    "계정"이란 나마가 “이용자”로부터 제공받은 이메일 등의 로그인 계정을 의미합니다. 일부 서비스를 이용하기 위해서는 계정이 반드시 필요할 수 있습니다.
    “서비스”라 함은 이용자가 단말기 또는 기타 디바이스를 이용하여 “FLAG”에 자신의 정보를 텍스트로 입력 및 활용하는 것을 말합니다.
    이 약관에서 사용하는 용어의 정의는 본 조 제1항에서 정하는 것을 제외하고는 서비스 내 안내 문구 및 관계법령에서 정하는 바에 따르며, 그 외에는 일반 상 관례에 따릅니다.
    제3조 약관의 명시와 개정
    ① 나마는 이 약관의 내용을 이용자가 알 수 있도록 서비스 이용 화면에서 표시하는 방법과, 서비스의 메뉴 화면으로 연결하여 접속할 수 있는 이용약관 화면에 게시하는 방법으로 이용자에게 공지합니다. 이용자가 이용약관에 동의한 때부터 약관의 효력이 발생합니다.
    ② 나마는 이용자가 나마와 이 약관의 내용에 관하여 질의 및 응답을 할 수 있도록 조치를 취합니다.
    ③ 나마는 이용자가 약관의 내용을 쉽게 알 수 있도록 작성하고 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 서비스 이용 동의, 개인정보의 처리, 이용자의 의무, 나마의 면책사항 등과 같은 중요한 내용을 이용자가 쉽게 이해할 수 있도록 굵은 글씨 등으로 처리하거나 별도의 연결화면 또는 팝업화면 등을 제공하고 이용자의 동의를 얻도록 합니다.
    ④ 나마는 「약관의 규제에 관한 법률」, 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 등 관련 법령에 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
    ⑤ 나마가 약관을 개정할 경우에는 적용일자 및 개정내용, 개정사유 등을 명시하여 그 적용일자로부터 최소한 7일 이전(이용자에게 불리하거나 중대한 사항의 변경은 30일 이전)부터 그 적용일자 경과 후 상당한 기간이 경과할 때까지 초기화면 또는 초기화면과의 연결화면을 통해 공지합니다.
    제4조 약관 외 준칙
    이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 「약관의 규제에 관한 법률」, 「정보통신망이용촉진 및 정보보호 등에 관한 법률」, 「저작권법」 등 관련 법령 또는 상관례에 따릅니다.
    제2장 이용계약 체결
    제5조 이용계약의 체결과 해지
    ****서비스 접속 후 이용자가 서비스 화면에 표시된 이용약관에 동의한 때부터 이용계약이 체결된 것으로 간주하며, 동의한 후부터 서비스를 이용할 수 있습니다. 이용자는 언제든지 서비스 이용을 원하지 않는 경우 이용계약 해지의 의사표시를 나마에게 전달할 수 있습니다.
    제6조 개인정보보호 및 관리
    ① 나마는 관련 법령이 정하는 바에 따라 이용자의 개인정보를 보호하기 위해 노력하며, 개인정보의 보호 및 사용에 대해서는 관련 법령 및 나마의 개인정보 처리방침에 따릅니다. 다만, 나마가 제공하는 서비스 이외의 링크된 서비스에서는 나마의 개인정보 처리방침이 적용되지 않습니다. ② 나마는 이용자의 귀책사유로 개인정보가 유출되어 발생한 피해에 대하여 책임을 지지 않습니다. ③ 회사는 관련 법령에 의해 관련 국가기관 등의 요청이 있는 경우를 제외하고는 회원의 개인정보를 본인의 동의 없이 타인에게 제공하지 않습니다.
    제3장 계약 당사자 의무
    제7조 나마의 의무
    ① 나마는 법령과 이 약관이 정하는 권리의 행사와 의무의 이행을 신의에 좇아 성실하게 하여야 합니다.
    ② 나마는 콘텐츠이용과 관련하여 "이용자"로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 지체없이 처리합니다. 즉시 처리가 곤란한 경우 이용자에게 그 사유와 처리 일정을 안내해야 합니다. 이용자가 제기한 의견이나 불만사항에 대해서는 전자우편 등을 통하여 그 처리과정 및 결과를 전달합니다.
    ③ 나마는 천재지변, 비상사태, 현재의 기술로 해결이 불가능한 장애나 결함 등 부득이한 사유가 없는 한 계속적이고 안정적인 서비스 제공을 위하여 최선의 노력을 다합니다.
    제8조 이용자 의무
    ① 이용자는 나마에서 제공하는 서비스의 이용과 관련하여 다음 각 호의 행위를 해서는 안 됩니다.
    불법적인 목적으로 운영진, 타 이용자, 기타 타인의 정보 도용
    서비스를 이용하여 도박 등 사행행위를 하거나 유도하는 행위, 음란/저속한 정보를 서비스 화면에 게재하는 행위, 수치심/혐오감 또는 공포심을 일으키는 글을 게재하거나 타인에게 전송 또는 유포하는 행위 등 서비스를 불건전하게 이용하는 행위
    서비스를 무단으로 영리, 영업, 판매 등 본래의 용도 이외의 용도로 사용하는 행위
    나마와 기타 제3자의 저작권 등 지적재산권에 대한 침해
    나마 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
    외설 또는 폭력적인 말이나 글, 기타 공서양속에 반하는 정보를 서비스에 공개 또는 게재하는 행위
    기타 불법적이거나 부당한 행위
    ② "이용자"는 관계법령, 이 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, 나마가 통지하는 사항 등을 준수하여야 합니다.
    제4장 서비스 이용
    제9조 서비스의 제공
    ① 나마는 모바일과 어플리케이션의 형태로 이용할 수 있는 웹사이트를 제공하며, 웹브라우저를 통해 접속하여 서비스를 이용할 수 있습니다.
    ② 나마는 제5조의 규정에 따라 이용계약이 체결된 이용자에게 그 즉시 서비스를 이용할 수 있도록 합니다.
    ③ 나마의 “FLAG”는 그 배포 형태로 인하여 연중무휴 24시간 제공됩니다. 기타 서비스의 수정, 기능 추가 및 삭제가 필요한 경우 나마의 서비스 화면 내 또는 기타 방법으로 7일 전부터 미리 공지할 수 있습니다.
    제10조 저작권 및 기타 권리의 귀속
    ① “FLAG” 및 “FLAG” 내 나마가 제작한 서비스 내의 콘텐츠에 대한 저작권과 기타 지식재산권은 나마에 귀속합니다.
    ② 이용자는 나마가 제작하고 권리를 보유한 서비스, 콘텐츠나 이미지를 나마의 사전 승낙없이 복제, 배포 및 기타 방법에 의하여 영리목적으로 사용하거나 제3자가 이용하게 할 수 없습니다.
    ③ 이용자는 나마가 정한 이용계약의 체결에 따라 서비스의 이용권을 부여받습니다. 이용자는 나마가 보유한 서비스의 전체 또는 일부를 양도, 판매, 담보 제공 등의 처분행위를 할 수 없습니다. ④ 회원이 작성한 글의 권리는 해당 글을 작성하여 게재한 회원에게 있으며, 해당 글로 인해 발생하는 문제에 대한 책임은 작성자 본인이 부담하게 됩니다. ⑤ 다른 회원이 작성한 글을 공유하거나 외부에 사용하기 위해서는 작성자에게 별도로 허락을 받아야 합니다. ⑥ 이 조는 유어슈가 서비스를 운영하는 동안 유효하며, 서비스 탈퇴 후에도 지속적으로 적용됩니다.
    제5장 손해배상 및 면책
    제11조 손해배상과 면책
    ① 나마 또는 이용자가 본 약관을 위반하여 상대방에게 손해를 입힌 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
    ② 나마는 아래의 사항에 대하여 책임지지 않습니다. 다만, 나마의 고의 또는 과실에 의한 경우에는 그러하지 아니합니다.
    나마의 고의 또는 과실로 인한 서비스 이용의 장애
    나마가 서비스를 이용하여 기대하는 이익을 얻지 못하거나 상실한 것
    이용자가 명함 서비스에 게시한 정보의 내용과 그 신뢰성, 정확성의 담보
    4.나마가 타 이용자가 서비스를 통해 표시한 정보를 신뢰하거나, 그 신뢰를 바탕으로 한 이용자와 이용자 또는 기타 제3자 간의 관계에서 발생한 문제
    다수가 공유하는 PC, 모바일 디바이스에서 서비스를 사용함으로써 발생한 정보 유출
    기타 자연재해, 국가재난상황 등 나마가 예상할 수 없거나 대비할 수 없는 불가항력적 사유로 인한 서비스 이용의 불가
    제12조 이용자의 의견 제기 및 분쟁 해결
    나마는 이용자의 편의를 위하여 서비스에 대한 이용자의 불만사항, 의견을 처리하고자 최선을 다하고 있으며, 이용자가 제기한 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 합리적인 기간 내에 이를 신속하게 처리합니다. 이용자의 불만사항, 의견, 기타 권리 침해 주장 및 신고는 본 약관 하단에 기재한 ‘팀 NAMA 이메일 team.flagapp@gmail.com’을 통해 해결합니다.
    제13조 재판권 및 준거법
    이 약관은 대한민국 법률에 따라 규율되고 해석됩니다. 나마와 이용자 간에 발생한 분쟁으로 소송이 제기되는 경우에는 법령에 정한 절차에 따른 법원을 관할 법원으로 합니다.
    본 약관은 2023년 8월 24일부터 시행 및 적용됩니다.*
    공고일: 2023년 8월 24일 / 시행일: 2023년 8월 24일
    서비스와 약관 및 기타 문의 사항은 팀 NAMA 이메일 team.flagapp@gmail.com에서 도움을 받으실 수 있습니다.
"""
}
