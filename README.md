# Language  
Dart  
<br/><br/>

# Framework  
Flutter  
<br/><br/>

# 패키지  
get, intl, flutter_localizations  
<br/><br/>

# 일정
### ~10/7  
메인화면(PlannerScreen), 일정상세페이지(PlanDetailScreen) 추가
일정들, 날짜 상태를 관리하는 GetXController 추가

### 10/8  
새로운 일정을 작성하는 AddPlanScreen ui 제작

### 10/9  
AddPlanScreen 상태관리를 위한 NewPlanController 추가

### 10/10
특정 theme을 적용시키는 Theme 위젯.
시간 선택 ui/ux는 TimePicker를 이용하기.
TimePicker의 시간 데이터 모델은 hour, minute을 속성으로 가진 TimeOfDay객체이다.
AddPlanScreen에서 위젯들을 분리 시키기, 
함수를 인자로 하위위젯에 전달할 때는, Function, VoidCallBack, ValueChanged<T>를 사용한다.
color를 선택할 때는, flutter_colorpicker 패키지를 사용하기

### 10/17
플랜 삭제하기 기능추가
플랜 편집하기 기능추가
(편집한 후 저장하는 기능필요)

### 10/18
플랜 편집한 후 수정하는 기능 추가
똑같이 NewPlanController를 사용하고 새로 생성할 때와 수정할 때 다른 생성자 사용
구분은 bool 속성으로 사용