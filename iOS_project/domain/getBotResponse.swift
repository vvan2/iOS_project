//
//  getBotResponse.swift
//  iOS_project
//
//  Created by sonjuwan on 6/4/25.
//

import Foundation

func getBotResponse(to input: String) -> String {
    let lowerInput = input.lowercased()

    if lowerInput.contains("안녕") || lowerInput.contains("hello") {
        return "안녕하세요! 무엇을 도와드릴까요?"
    } else if lowerInput.contains("시간표") || lowerInput.contains("수업") {
        return "시간표는 '일정(Schedule)' 탭에서 확인하실 수 있어요."
    } else if lowerInput.contains("졸업") {
        return "졸업 요건은 학교 홈페이지 또는 학사팀 공지를 확인해주세요. 필요한 학점 수, 졸업 논문 여부 등을 반드시 확인하세요."
    } else if lowerInput.contains("학사공지") || lowerInput.contains("공지사항") {
        return "최근 학사 공지는 학교 포털의 '학사공지' 게시판에서 확인할 수 있어요."
    } else if lowerInput.contains("비교과") || lowerInput.contains("포인트") {
        return "비교과 프로그램 참여 현황 및 포인트는 비교과 누리집에서 확인할 수 있습니다."
    } else if lowerInput.contains("교양") {
        return "교양 과목은 수강편람에서 확인할 수 있고, 영역별 이수 조건을 꼭 확인하세요."
    } else if lowerInput.contains("기숙사") {
        return "기숙사 관련 문의는 생활관 행정실 또는 해당 포털을 통해 확인하실 수 있어요."
    } else if lowerInput.contains("도서관") {
        return "도서관 운영 시간, 좌석 예약, 자료 검색 등은 도서관 홈페이지에서 확인할 수 있어요."
    } else if lowerInput.contains("수강신청") {
        return "수강신청 일정은 학사 일정 공지에서 확인할 수 있으며, 신청 전 수강편람을 미리 확인하세요."
    } else if lowerInput.contains("지도교수") || lowerInput.contains("멘토") {
        return "지도교수님 관련 문의는 소속 학과 행정실에 문의하시거나 학생 포털에서 확인할 수 있습니다."
    } else {
        return "죄송해요, 잘 이해하지 못했어요 😥 더 구체적으로 말씀해주시면 도와드릴게요!"
    }
}
