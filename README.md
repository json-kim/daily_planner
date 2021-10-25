# Language  
Dart  
<br/><br/>

# Framework  
Flutter  
<br/><br/>

# 패키지  
get, intl, flutter_localizations, flutter_colorpicker, pull_to_refresh, google_fonts, sqflite  
<br/><br/>

# 일정
### ~10/7  
메인화면(PlannerScreen), 일정상세페이지(PlanDetailScreen) 추가
일정들, 날짜 상태를 관리하는 PlanController, DateController 추가

</br>

### 10/8  
#### AddPlanScreen
 + ##### 일정추가페이지(AddPlanScreen) 제작

</br>

### 10/9  
#### NewPlanController
 + ##### AddPlanScreen 상태관리를 위한 NewPlanController 추가

</br>

### 10/10
#### AddPlanScreen
 + ##### 시간 선택 ui/ux추가 (TimeOfDay TimePicker 사용)
 + ##### AddPlanScreen에서 components분리
 + ##### Plan의 color선택 ui/ux추가 (flutter_colorpicker 패키지 사용)

</br>

### 10/17
#### PlanDetailScreen, PlanController
 + ##### 플랜 삭제하기 기능추가
 + ##### 플랜 편집하기 기능추가 (편집한 후 저장하는 기능필요)

</br>

### 10/18
#### AddPlanScreen, NewPlanController, PlanController
 + ##### 플랜 편집한 후 저장하는 기능 추가
 + ##### 똑같이 NewPlanController를 사용하고 새로 생성할 때와 수정할 때 다른 생성자 사용

</br>

### 10/19
#### PlanDetailScreen
 + ##### ui단순화(TitleBar, DateBar, TimeBar)
 + ##### TimeBar에서 총 시간, 남은 시간 표시
#### Plan
 + ##### 불필요한 플랜 진행상황 가짓수를 단순화(4가지 -> 2가지)

</br>

### 10/20
#### PlanDetailScreen
 + ##### TimeBar에서 남은 시간, 진행중, 종료 상태로 구분하여 표시

</br>

### 10/21
#### PlannerScreen
 + ##### DateBar pull to refresh / loading 추가 (pull_to_refresh 패키지 사용)
 + ##### selectedDate가 있는 페이지로 돌아가는 버튼 추가
#### PlanDetailScreen
 + ##### DateBar ui 개선(Title에서 연도를 표시하고 DateBar와 통합)
#### DateController
 + ##### GetXController를 확장한 클래스를 Get.put을 사용하지 않고 그냥 초기화하여 사용한다면 글로벌하게 상태관리가 되지 않는다. Get.put을 거쳐야만 한다.
#### PlanController
 + ##### list에 insert를 통해 list앞에 삽입하였을 경우, 기존의 원소를 찾는 indexOf가 -1을 리턴한다.(해당 원소를 못 찾는다., insert의 동작원리를 살펴봐야 한다.)

</br>

### 10/23
#### AddPlanScreen
 + ##### time picker에서 endTime을 설정할 때, startTime 이후로만 선택 가능하게 변경 -> 저장할때 체크(NewPlanController.planSave)
#### DBController
 + ##### sqflite 패키지를 사용하여 sqlite의 db에 테이블을 생성하여 저장
 + ##### plan을 insert, update, delete
 + ##### plan에 toMap, fromMap 메소드 추가

 </br>

### 10/24
#### PlannerScreen
 + ##### PlanCard ui 개선
 + ##### SizeConfig 이용하여 반응형 앱으로 제작(plannerScreen)

</br>

### 10/25
#### PlanDetailScreen, AddPlanScreen
 + ##### SizeConfig 이용하여 반응형 앱으로 제작(PlanDetailScreen, AddPlanScreen)
#### constants
 + ##### fontSize를 headline1~6, subtitle1~2로 구분