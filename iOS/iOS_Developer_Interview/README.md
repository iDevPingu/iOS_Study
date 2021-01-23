

# iOS Developer Interview (from : https://github.com/JeaSungLEE/iOSInterviewquestions)
> ## iOS
> ### Q : Bounds 와 Frame 의 차이점을 설명하시오.
 - A : [Bounds와 Frame의 차이점](https://icksw.tistory.com/132)
> ### Q : 실제 디바이스가 없을 경우 개발 환경에서 할 수 있는 것과 없는 것을 설명하시오.
 - A : 실제 디바이스가 없을 경우에 카메라 촬영 기능을 사용할 수 없습니다. 하지만 앨범은 작동하기 때문에 PhotoKit을 사용하는것은 가능합니다. 또한 광센서, 근접 센서도 사용할 수 없습니다. 시뮬레이터에서의 성능은 실제 디바이스에서의 성능과 차이가 있을 수 있기 때문에 정확한 테스트라고 볼 수는 없습니다. 즉 시뮬레이터에서 할 수 있는 것은 UI확인과 기본적이 기능 정도입니다.
 - [simulator 설명서](https://help.apple.com/simulator/mac/current/#/deve44b57b2a)
 - [simulator 차이점](https://developer.apple.com/library/archive/documentation/IDEs/Conceptual/iOS_Simulator_Guide/TestingontheiOSSimulator/TestingontheiOSSimulator.html)
> ### Q : 앱이 foreground에 있을 때와 background에 있을 때 어떤 제약사항이 있나요?
 - [Foreground, Background 알아보기](https://icksw.tistory.com/178)
 - A : 앱이 백그라운드 상태가 되면 시스템은 시간 할당을 해주지 않고 특수한 상황에만 시간할당을 해줍니다. 블루투스 통신, 사용자 위치 정보, 서버 업데이트, Voice over IP(음성 인터넷 프로토콜), Apple Push Notification, AirPlay, Picture in Picture 비디오를 사용한 오디오 통신, 외부 악세서리 통신의 경우에만 시스템은 백그라운드 앱에 시간을 할당해줍니다.
> ### Q : 상태 변화에 따라 다른 동작을 처리하기 위한 앱델리게이트 메서드들을 설명하시오.
> ### Q : scene delegate에 대해 설명하시오.
 - A : [Multiple Window를 위한 Scenedelegate](https://icksw.tistory.com/137)
 - A : 간단하게 말하자면 iOS 13 업데이트로 인해 아이패드에서 multiple window를 지원하게 되면서 하나의 앱이 여러개의 window를 가질 수 있게 되었고 이들을 처리하기 위하여 기존의 방식인 window를 1개만 가질 수 있는 방식을 확장한 것 입니다. 이로 인해 UI LifeCycle의 책임을 Scene Delegate가 가지게 되었습니다.
> ### Q : 앱이 In-Active 상태가 되는 시나리오를 설명하시오.
> ### Q : NSOperationQueue 와 GCD Queue 의 차이점을 설명하시오.
 - 개념 : [NSOperationQueue](https://icksw.tistory.com/35), [GCD Queue](https://icksw.tistory.com/70)
 - 사용법 : [NSOperatinnQueue](https://icksw.tistory.com/105), [GCD Queue](https://icksw.tistory.com/99)
 - A : NSOperationQueue는 종속성을 지원하며 작업이라는 객체를 통해 명령을 수행합니다. 이 때 작업을 시작하는 방법은 start 메서드를 호출하거나 큐에 추가하여 실행 할 수 있습니다. Grand Central Dispatch Queue는 작업 객체를 따로 만들 필요 없이 코드 블록으로 작업을 만들고 큐에 넣어 실행할 수 있습니다.
> ### Q : GCD API 동작 방식과 필요성에 대해 설명하시오.
 - [GCD Queue](https://icksw.tistory.com/70)
 - A : 스레드를 직접 만들고 작업하는 것 보다 간단하게 동시성을 구현할 수 있기 때문에 유용합니다. 또한 스레드를 직접 만들때 고려해줘야할 공유 자원에 대한 접근, lock 등에 대한 것들을 직접하면 실수 할 수 있는데 GCD API를 사용하여 실수 없이 편리하게 사용할 수 있습니다.
> ### Q : 자신만의 Custom View를 만들려면 어떻게 해야하는지 설명하시오.
 - A : 어떤 타입의 커스텀 뷰를 만드는지를 결정하고 직접 코드로 만들 수도 있고 xib를 사용하여 만들 수도 있습니다. 직접 코드로 만들게 되면 addSubview와 같은 메서드를 활용하면 됩니다.
> ### Q : iOS 앱을 만들고, User Interface를 구성하는 데 필수적인 프레임워크 이름은 무엇인가?
 - A : [UIKit](https://developer.apple.com/documentation/uikit)
> ### Q : Foundation Kit은 무엇이고 포함되어 있는 클래스들은 어떤 것이 있는지 설명하시오.
> ### Q : Delegate란 무언인가 설명하고, retain 되는지 안되는지 그 이유를 함께 설명하시오.
> ### Q : NotificationCenter 동작 방식과 활용 방안에 대해 설명하시오.
 - A : 
> ### Q : UIKit 클래스들을 다룰 때 꼭 처리해야하는 애플리케이션 쓰레드 이름은 무엇인가?
 - A : main
> ### Q : TableView를 동작 방식과 화면에 Cell을 출력하기 위해 최소한 구현해야 하는 DataSource 메서드를 설명하시오.
 - A : 2 개의 메서드가 있습니다.
 - tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 메서드는 테이블 뷰에서 섹션 당 Row의 개수를 정하는 메서드 입니다.
 - tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 메서드는 테이블 뷰에서 특정 indexPath에 표시할 cell을 반환하는 메서드입니다. 여기서 row의 개수는 바로 위의 메서드에서 정해집니다.
 - [UITableViewDataSource](https://icksw.tistory.com/15)
> ### Q : 하나의 View Controller 코드에서 여러 TableView Controller 역할을 해야 할 경우 어떻게 구분해서 구현해야 하는지 설명하시오
 - 여러개의 테이블 뷰를 addSubview나 스토리보드에서 추가하고 각각의 뷰마다 적절한 constraint를 줘서 구역을 나눕니다. 그런 뒤 각각의 테이블 뷰에 필요한 TableViewCell을 코드로 만들거나 스토리보드로 추가하고 코드로 추가했다면 ViewController에서 register 메서드로 추가해줍니다. 이 때 cellIdentifier에 주의해야합니다. 그런 뒤 UITableViewDataSource 프로토콜의 필수 메서드에서 각각의 테이블 뷰를 구분하여 셀을 구성하면 됩니다. 메서드들에 들어오는 UITableView 객체로 구분할 수 있습니다.
> ### Q : App Bundle의 구조와 역할에 대해 설명하시오.
> ### Q : View 객체에 대해 설명하시오.
 - [UIView 알아보기](https://icksw.tistory.com/139)
 - A : UIView는 간단하게 말하면 화면의 직사각형 모양을 관리하는 객체입니다. 앱이 사용자와 상호작용하는 주요 방법이기 때문에 Draw, Animation, Layout, Subview, event handling에 대한 책임이 있습니다.
> ### Q : UIView 에서 Layer 객체는 무엇이고 어떤 역할을 담당하는지 설명하시오.
> ### Q : UIWindow 객체의 역할은 무엇인가?
 - [UIWindow 알아보기](https://icksw.tistory.com/140)
 - A : 앱의 UI 배경과 이벤트를 뷰로 전달하는 객체입니다. 뷰 컨트롤러와 함께 이벤트를 처리하고 앱 작동에 필수적이 많은 작업을 수행합니다. iOS12 까지는 하나의 window만 제공했는데 iOS13부터 multiwindow를 지원하게 되면서 여러개의 window를 사용할 수 있게 되었고 이로인해 [SceneDelegate](https://icksw.tistory.com/137)가 생겨나게 되었습니다. 
> ### Q : UINavigationController 의 역할이 무엇인지 설명하시오.
> ### Q : 모든 ViewController 객체의 상위 클래스는 무엇이고 그 역할은 무엇인가?
> ### Q : 앱이 시작할 때 main.c 에 있는 UIApplicationMain 함수에 의해서 생성되는 객체는 무엇인가?
> ### Q : UIApplication 객체의 컨트롤러 역할은 어디에 구현해야 하는가?
> ### Q : 앱의 콘텐츠나 데이터 자체를 저장/보관하는 특별한 객체를 무엇이라고 하는가?
> ### Q : 앱 화면의 콘텐츠를 표시하는 로직과 관리를 담당하는 객체를 무엇이라고 하는가?
> ### Q : Swift의 클로저와 Objective-C의 블록은 어떤 차이가 있는가?
> ### Q : App의 Not running, Inactive, Active, Background, Suspended에 대해 설명하시오.
 - A :
 Not Running : 
 InActive :
 Active :
 Background : 
 Suspended : 
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
 - [Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/)
 - A : SnapKit 사용하는 방법, 뷰 자체 constraint들에 제약조건을 주는 방법
> ### Q : hugging, resistance에 대해서 설명하시오.
> ### Q : Intrinsic Size에 대해서 설명하시오.
> ### Q : 스토리보드를 이용했을때의 장단점을 설명하시오.
> ### Q : Safearea에 대해서 설명하시오.
 - A : 
> ### Q : Left Constraint 와 Leading Constraint 의 차이점을 설명하시오.

> ## Swift
> ### Q : Optional 이란 무엇인지 설명하시오.
