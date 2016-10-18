//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//如果Swift类想要被OC发现，必须继承自NSObject并且使用public标记，并且该类中想要被OC访问的方法也必须使用public标记，具体知识可以去看Swift的访问控制
//原因：Swift的代码对于OC来说是作为一个module存在的
//

/*
 如果宏定义用到了oc的方法，swift就不能用这个宏了。
 */
#import "UtilMarco.h"

#import "Tooles.h"      // 在swift里面就可以用Tooles里面的方法了。
