

# iOS Developer Interview (from : https://github.com/JeaSungLEE/iOSInterviewquestions)
> ## iOS
> ### Q : Bounds 와 Frame 의 차이점을 설명하시오.
 - [Bounds와 Frame의 차이점](https://icksw.tistory.com/132)
 - A : Bounds는 뷰 자체 좌표계로 자신의 위치를 표현하는 것이고 Frame은 뷰의 슈퍼뷰의 좌표계로 자신의 위치를 표현하는 방법입니다.
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
 - A : Foundation Framework에는 데이터 저장, 영속성, 텍스트 처리, 날짜 및 시간 계산, 정렬 및 필터링, 네트워킹을 포함한 앱 및 프레임워크에 대한 기본적인 기능을 제공합니다. Numbers, Data, String, Collection, Date, Time Data Formatting, Filters, sorting, Task Management, asset, bundle, Notification, App Extension Support, Errors, Exceptions, file system, URL 등의 다양한 기본적인 클래스들이 정의되어 있습니다.
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
 - [CALayer 알아보기](https://icksw.tistory.com/181)
 - A : 렌더링에 사용되는 객체로 뷰에 표시할 이미지 기반 콘텐츠들을 관리하고 해당 콘텐츠에 애니메이션을 수행할 수 있는 객체입니다. 이는 사진이나 영상과 같은 콘텐츠는 물론 뷰의 backgroundColor, shadow, cornerRadius와 같은 값들도 처리합니다. 
> ### Q : UIWindow 객체의 역할은 무엇인가?
 - [UIWindow 알아보기](https://icksw.tistory.com/140)
 - A : 앱의 UI 배경과 이벤트를 뷰로 전달하는 객체입니다. 뷰 컨트롤러와 함께 이벤트를 처리하고 앱 작동에 필수적이 많은 작업을 수행합니다. iOS12 까지는 하나의 window만 제공했는데 iOS13부터 multiwindow를 지원하게 되면서 여러개의 window를 사용할 수 있게 되었고 이로인해 [SceneDelegate](https://icksw.tistory.com/137)가 생겨나게 되었습니다. 
> ### Q : UINavigationController 의 역할이 무엇인지 설명하시오.
 - A : 네비게이션 컨트롤러는 하나 이상의 뷰 컨트롤러를 관리하는 컨테이너 뷰 컨트롤러입니다. 여러개의 뷰 컨트롤러를 가지고 있지만 하나의 뷰만 보이게 해주며 뷰들은 스택에 쌓이게 됩니다. 네비게이션 컨트롤러를 사용하면 왼쪽 가장자리 스와이프 제스처를 사용하여 뷰를 제거할 수도 있습니다. 네비게이션 뷰 컨트롤러는 사용자의 상호작용을 통해 새로운 뷰 컨트롤러를 보여주거나 제거하는 역할을 합니다. 
> ### Q : 모든 ViewController 객체의 상위 클래스는 무엇이고 그 역할은 무엇인가?
> ### Q : 앱이 시작할 때 main.c 에 있는 UIApplicationMain 함수에 의해서 생성되는 객체는 무엇인가?
> ### Q : UIApplication 객체의 컨트롤러 역할은 어디에 구현해야 하는가?
> ### Q : 앱의 콘텐츠나 데이터 자체를 저장/보관하는 특별한 객체를 무엇이라고 하는가?
 - [UserDefaults를 사용하여 정보 저장하기](https://icksw.tistory.com/146)
 - A : UserDefaults
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
 - A : Visual Format Language 를 통한 구현, Anchor를 사용하는 방법, NSLayoutConstraint를 사용하느 방법
> ### Q : hugging, resistance에 대해서 설명하시오.
> ### Q : Intrinsic Size에 대해서 설명하시오.
> ### Q : 스토리보드를 이용했을때의 장단점을 설명하시오.
 - 뷰를 빠르게 만들수 있고 오토 레이아웃도 쉽게 적용 할 수 있습니다. 또한 뷰를 만들면 바로바로 보이기 때문에 어떻게 만들어져 가고 있는지도 확인할 수 있습니다. 하지만 스토리보드에 작업을 계속 하다보면 처리시간이 늘어나게 되며 협업을 할 때 어디를 수정하더라도 알아차리기 쉽지 않을 수 있습니다. 또한 협업시 merge를 할 때 컴플릭트가 발생할 가능성이 있습니다. 스토리보드로 할 수 있는 것은 코드로 모두 할 수 있지만 코드로 할 수 있는 것 중에는 스토리보드로 할 수 없는 것들이 존재합니다. 예를 들면 뷰를 둥글게 만들어주는 cornerRadius가 있습니다. 이렇게 장단점을 가지고 있으므로 적절하게 사용하고, 스토리보드가 없이도 작업할 수 있는 능력을 갖출 필요가 있다고 생각합니다.
> ### Q : Safearea에 대해서 설명하시오.
 - A : 
> ### Q : Left Constraint 와 Leading Constraint 의 차이점을 설명하시오.
 - A : 
> ## Swift
> ### Q : Optional 이란 무엇인지 설명하시오.
 - A : 값이 있을 수도 없을 수도 있는 값을 처리할 때 사용하는 방법입니다. 만약 값이 없다면 nil이 존재하게 되며 값이 있다면 뭔가의 값이 존재하게 됩니다. 하지만 옵셔널 값을 바로 사용할 수는 없고 값이 있는지 없는지를 확인하는 과정인 wrapping 과정이 필요합니다. 이를 통해 일반적인 값으로 처리되어 사용할 수 있습니다.
> ### Q : Fast Enumeration 이란 무엇인지 설명하시오.
> ### Q : Struct 가 무엇이고 어떻게 사용하는지 설명하시오.
 - A : 구조체라고 불리는 Struct는 값 타입의 객체입니다. 
> ### Q : instance 메서드와 class 메서드의 차이점을 설명하시오.
 - A : instance 메서드를 사용하기 위해선 인스턴스를 먼저 만들고 메서드를 사용할 수 있지만 class 메서드는 타입 메서드의 일종으로 타입 메서드란 타입 자체에서 호출 가능한 메서드 입니다. 이 때 가능한 것으로는 struct, enum, class가 있는데 class만 참조 타입이므로 class라는 키워드로 타입 메서드를 만들 수 있습니다. Struct나 enum의 경우에는 static으로 만들 수 있습니다. 이러한 이뉴는 클래스에는 상속이라는 개념이 존재하여 이러한 메서드도 override 할 수 있게 하기 위해서입니다.
> ### Q : Delegate 패턴을 활용하는 경우를 예를 들어 설명하시오.
> ### Q : Singleton 패턴을 활용하는 경우를 예를 들어 설명하시오.
 - A : 앱 내에서 하나의 객체만 존재하게 만들어서 이를 공유하여 사용하기 좋을 때 사용합니다.
> ### Q : KVO 동작 방식에 대해 설명하시오.
> ### Q : Delegates와 Notification 방식의 차이점에 대해 설명하시오.
> ### Q : 멀티 쓰레드로 동작하는 앱을 작성하고 싶을 때 고려할 수 있는 방식들을 설명하시오.
> ### Q : MVC 구조에 대해 블록 그림을 그리고, 각 역할과 흐름을 설명하시오.
> ### Q : 프로토콜이란 무엇인지 설명하시오.
 - [Protocol 공식문서 정리](https://icksw.tistory.com/62)
> ### Q : Hashable이 무엇이고, Equatable을 왜 상속해야 하는지 설명하시오.
> ### Q : mutating 키워드에 대해 설명하시오.
> ### Q : 탈출 클로저에 대하여 설명하시오.
 - [AutoClosure, EscapingClosure 알아보기](https://icksw.tistory.com/157)
> ### Q : Extension에 대해 설명하시오.
 - [Extension 공식문서 정리](https://icksw.tistory.com/59)
 - A : 익스텐션은 기존에 존재하던 타입에 새로운 기능을 추가하는 기능을 제공합니다. 익스텐션을 사용하여 인스턴스 메서드, 타입 메서드, 생성자, 서브 스크립트, 중첩 타입 정의, 기존 타입이 특정 프로토콜을 준수하게 만들기, 계산 프로퍼티를 추가할 수 있습니다. extension 키워드를 특정 타입 앞에 적어서 기능을 추가하면 되며 저장 프로퍼티나 기존에 존재하던 프로퍼티에 대한 옵저버를 만들 수는 없습니다. 생성자를 만들 때에도 convenience 생성자는 만들 수 있지만 designated 생성자는 만들 수 없습니다. 구조체나 열거형에 인스턴스 값을 수정하는 메서드를 만들 땐 mutating 키워드를 사용해야합니다.
> ### Q : 접근 제어자의 종류엔 어떤게 있는지 설명하시오.
 - [Access Control 공식문서 정리](https://icksw.tistory.com/118)
> ### Q : defer란 무엇인지 설명하시오.
> ### Q : defer가 호출되는 순서는 어떻게 되고, defer가 호출되지 않는 경우를 설명하시오.

> ## ARC
> ### [Automatic Reference Counting 공식문서 정리](https://icksw.tistory.com/80)
> ### Q : ARC란 무엇인지 설명하시오.
 - A : 코드 내에서 클래스 인스턴스에 대한 참조 횟수를 세고 이를 통한 메모리 관리를 하는 방법입니다. 참조 횟수가 0이 되면 메모리에서 해제되고 그렇지 않다면 메모리에 계속해서 남아있게 됩니다. 별 다른 설정을 해주지 않으며 강한 참조로 참조하게 되는데, weak이나 unowned 키워드를 사용하여 약한 참조로 만들 수 있습니다. 강한 참조로 만들게 되면 직접 할당 해제를 해줘야 참조 횟수가 줄어들게 되고 이를 제대로 해주지 않으면 메모리 누수가 발생하게 됩니다.
> ### Q : Retain Count 방식에 대해 설명하시오.
> ### Q : Strong 과 Weak 참조 방식에 대해 설명하시오.
 - A : Strong 참조 방식은 별다른 선언 없이 변수를 할당하면 참조 주기가 생성됩니다. Strong 방식으로 참조한다면 직접 할당 해제를 해줘야 참조 카운트가 감소하게 되고 이를 모두 해제해주지 않으면 메모리 누수가 발생합니다. 이를 보완하기 위해 weak 참조가 있는데요, 참조할 때 weak 키워드를 사용하면 사용할 수 있습니다. weak 참조는 참조 카운트를 변화시키지 않기 때문에 이를 사용하면 인스턴스를 참조하고 있더라도 해당 인스턴스는 할당 해제 될 수 있습니다. 이렇게 항상 값이 변경될 수 있기 때문에 weak 참조는 항상 변수에만 사용할 수 있습니다. 
> ### Q : ARC 대신 Manual Reference Count 방식으로 구현할 때 꼭 사용해야 하는 메서드들을 쓰고 역할을 설명하시오.
> ### Q : retain 과 assign 의 차이점을 설명하시오.
> ### Q : 순환 참조에 대하여 설명하시오.
> ### Q : 강한 순환 참조 (Strong Reference Cycle) 는 어떤 경우에 발생하는지 설명하시오.
> ### Q : 특정 객체를 autorelease 하기 위해 필요한 사항과 과정을 설명하시오.
> ### Q : Autorelease Pool을 사용해야 하는 상황을 두 가지 이상 예로 들어 설명하시오.
> ### Q : 다음 코드를 실행하면 어떤 일이 발생할까 추측해서 설명하시오. Ball *ball = [[[[Ball alloc] init] autorelease] autorelease];

> ## Functional Programming
> ### Q : 함수형 프로그래밍이 무엇인지 설명하시오.
> ### Q : 고차 함수가 무엇인지 설명하시오.
> ### Q : Swift Standard Library의 map, filter, reduce, compactMap, flatMap에 대하여 설명하시오.
