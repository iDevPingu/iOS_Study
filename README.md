# PinguiOS
## 블로그 : https://icksw.tistory.com

# Swift Study

# iOS Study
> ## UIFont
> ## UITableView
 - [스토리보드 없이 TableView 만들기](https://icksw.tistory.com/96)
 
> ## UICollectionView
 - [스토리보드 없이 CollectionView 만들기](https://icksw.tistory.com/45?category=877391)

> ## UINavigationView
 - [스토리보드 없이 NavigationView 만들기](https://icksw.tistory.com/48)
 
> ## UITabBarController
 - [스토리보드 없이 TabBarController 만들기](https://icksw.tistory.com/106)
 
> ## GCD
 - DispatchQueue
   - [DispatchQueue로 동시성 구현해보기](https://icksw.tistory.com/99)
 - OperatingQueue
   - [OperatingQueue로 동시성 구현해보기](https://icksw.tistory.com/105)

# iOS Developer Question (from : https://github.com/JeaSungLEE/iOSInterviewquestions)
> ## iOS
> ### Q : Bounds 와 Frame 의 차이점을 설명하시오.
 - A : [Bounds와 Frame의 차이점](https://icksw.tistory.com/132)
> ### Q : 실제 디바이스가 없을 경우 개발 환경에서 할 수 있는 것과 없는 것을 설명하시오.
 - A : 실제 디바이스가 없을 경우에 카메라 촬영 기능을 사용할 수 없습니다. 하지만 앨범은 작동학 때문에 PhotoKit을 사용하는것은 가능합니다. 또한 광센서, 근접 센서도 사용할 수 없습니다. 시뮬레이터에서의 성능은 실제 디바이스에서의 성능과 차이가 있을 수 있기 때문에 정확한 테스트라고 볼 수는 없습니다.
 - [simulator 설명서](https://help.apple.com/simulator/mac/current/#/deve44b57b2a)
 - [simulator 차이점](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/iOS_Simulator_Guide/TestingontheiOSSimulator/TestingontheiOSSimulator.html)
> ### Q : 앱이 foreground에 있을 때와 background에 있을 때 어떤 제약사항이 있나요?
> ### Q : 상태 변화에 따라 다른 동작을 처리하기 위한 앱델리게이트 메서드들을 설명하시오.
> ### Q : scene delegate에 대해 설명하시오.
 - A : [Multiple Window를 위한 Scenedelegate](https://icksw.tistory.com/137)
> ### Q : 앱이 In-Active 상태가 되는 시나리오를 설명하시오.
> ### Q : NSOperationQueue 와 GCD Queue 의 차이점을 설명하시오.
 - A : [NSOperationQueue](https://icksw.tistory.com/35), [GCD Queue](https://icksw.tistory.com/70)
 - 요약 : 
> ### Q : GCD API 동작 방식과 필요성에 대해 설명하시오.
 - A : [GCD Queue](https://icksw.tistory.com/70)
 - 요약 : 
> ### Q : 자신만의 Custom View를 만들려면 어떻게 해야하는지 설명하시오.
> ### Q : iOS 앱을 만들고, User Interface를 구성하는 데 필수적인 프레임워크 이름은 무엇인가?
 - A : UIKit
> ### Q : Foundation Kit은 무엇이고 포함되어 있는 클래스들은 어떤 것이 있는지 설명하시오.
> ### Q : Delegate란 무언인가 설명하고, retain 되는지 안되는지 그 이유를 함께 설명하시오.
> ### Q : NotificationCenter 동작 방식과 활용 방안에 대해 설명하시오.
> ### Q : UIKit 클래스들을 다룰 때 꼭 처리해야하는 애플리케이션 쓰레드 이름은 무엇인가?
> ### Q : TableView를 동작 방식과 화면에 Cell을 출력하기 위해 최소한 구현해야 하는 DataSource 메서드를 설명하시오.
 - A : 2 개의 메서드가 있습니다.
 - tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 메서드는 테이블 뷰에서 섹션 당 Row의 개수를 정하는 메서드 입니다.
 - tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 메서드는 테이블 뷰에서 특정 indexPath에 표시할 cell을 반환하는 메서드입니다. 여기서 row의 개수는 바로 위의 메서드에서 정해집니다.
 - [UITableViewDataSource](https://icksw.tistory.com/15)
> ### Q : 하나의 View Controller 코드에서 여러 TableView Controller 역할을 해야 할 경우 어떻게 구분해서 구현해야 하는지 설명하시오
> ### Q : App Bundle의 구조와 역할에 대해 설명하시오.
> ### Q : View 객체에 대해 설명하시오.
> ### Q : UIView 에서 Layer 객체는 무엇이고 어떤 역할을 담당하는지 설명하시오.
> ### Q : UIWindow 객체의 역할은 무엇인가?
> ### Q : UINavigationController 의 역할이 무엇인지 설명하시오.
> ### Q : 모든 View Controller 객체의 상위 클래스는 무엇이고 그 역할은 무엇인가?
> ### Q : 앱이 시작할 때 main.c 에 있는 UIApplicationMain 함수에 의해서 생성되는 객체는 무엇인가?
> ### Q : UIApplication 객체의 컨트롤러 역할은 어디에 구현해야 하는가?
> ### Q : 앱의 콘텐츠나 데이터 자체를 저장/보관하는 특별한 객체를 무엇이라고 하는가?
> ### Q : 앱 화면의 콘텐츠를 표시하는 로직과 관리를 담당하는 객체를 무엇이라고 하는가?
> ### Q : Swift의 클로저와 Objective-C의 블록은 어떤 차이가 있는가?
> ### Q : App의 Not running, Inactive, Active, Background, Suspended에 대해 설명하시오.
> ### Q : App thinning에 대해서 설명하시오.
> ### Q : Global DispatchQueue 의 Qos 에는 어떤 종류가 있는지, 각각 어떤 의미인지 설명하시오.
 - A : Qos(Quality Of Service)란 작업 실행의 우선순위를 지정합니다. qos를 정의하면 앱이 수행하려는 작업의 의도를 알 수 있고 작업 실행의 우선순위 결정에 영향을 줍니다.
   - UserInteractive : 애니메이션, 이벤트 처리 또는 앱의 사용자 인터페이스 업데이트와 같은 상호 작용 작업을 위한 qos
   - userInitiated : 사용자가 앱을 적극적으로 사용하지 못하게 하는 작업에 대한 qos
   - 'default' : 기본 qos
   - utility : 사용자가 적극적으로 추적하지 않는 작업에 대한 qos
   - background : 생성된 것의 유지 관리, 정리 작업에 대한 qos
   - unspecified : qos를 설정하지 않음
> ## AutoLayout
> ### Q : 오토레이아웃을 코드로 작성하는 방법은 무엇인가? (3가지)
> ### Q : hugging, resistance에 대해서 설명하시오.
> ### Q : Intrinsic Size에 대해서 설명하시오.
> ### Q : 스토리보드를 이용했을때의 장단점을 설명하시오.
> ### Q : Safearea에 대해서 설명하시오.
> ### Q : Left Constraint 와 Leading Constraint 의 차이점을 설명하시오.

> ## Swift
> ### Q : Optional 이란 무엇인지 설명하시오.
# iOS Project
## WithoutSB라는 이름이 붙은 프로젝트는 스토리보드 없이 코드로만 작성했습니다.
> # TableViewStudy
 - TableViewWithoutSB
   - 스토리보드 없이 테이블 뷰로 만든 앱
 - TableViewWithoutSB_MVVM
   - 스토리보드 없이 테이블 뷰로 만든 앱을 MVVM 디자인 패턴으로 리팩토링

> # CollectionViewStudy
 - CollectionViewWithoutSB
   - 스토리보드 없이 컬렉션 뷰로 만든 앱
   - Animation을 적용해봤습니다.
   - MVVM 디자인 패턴으로 작성했습니다.

> # AppleMusicApp
 - AppleMusicWithoutSB
   - AVFoundation 사용해보기
   - CollectionView HeaderView 추가해보기
   - CollectionView CustomCell 사용해보기

> # ToyProject
 - LvUpTodo
   - TodoList에 Game을 결합한 앱
   - 자신을 하나의 캐릭터 처럼 육성하는 계획 앱
   - ## [앱 스토어 링크](https://apps.apple.com/kr/app/lvup-todo-레벨을-올리는-todo-list/id1537835629)
   
   Screenshots
   -----------
  <div>
 <img width = "1000" src="https://user-images.githubusercontent.com/43135067/97694374-cd5a1d00-1ae5-11eb-81dd-81d4bf567116.png">
 </div>
 

# ChatBot
> # 여행 친구를 찾아주는 챗봇 '여우'
 - https://github.com/saitros/Team-Lost-Star
  - KakaoTalk에서 사용가능한 챗봇 구현
  - Python3 사용

# Algorithm
> ## Sorting
>> ### QuickSort
>> ### MergeSort
>> ### [HeapSort](https://icksw.tistory.com/91?category=885659)

> ## 최소비용신장트리 (Minimum Cost Spanning Tree)
>> ### [Kruskal](https://icksw.tistory.com/97?category=885659)

> ## BFS, DFS
>> ### BFS
>> ### DFS

> ## [Dijkstra](https://icksw.tistory.com/94?category=885659)

