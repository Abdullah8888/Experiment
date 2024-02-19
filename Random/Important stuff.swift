//
//  Important stuff.swift
//  Experiment
//
//  Created by Abdullah on 18/02/2024.
//

import Foundation

func importantStuff() {
    //print(res)
    var arr = [2, 1, 3, 1, 2]
    //mergeSort(&arr)


    //func ss(b: Int) -> () -> Int {
    //    var a = 0
    //    func sum() -> Int {
    //        a += b
    //        return a
    //    }
    //    return sum
    //}
    //
    //
    //let dd = ss(b: 10)
    //print(dd())
    //print(dd())
    //
    //let ddd = ss(b: 5)
    //print(ddd())
    //print(ddd())

    //let arrr = [[1,2,3],[2,3,2],[3,2,3]]
    //
    //print(arrr.flatMap{$0})
    //print(arrr.map{$0})
    //print(Array(arrr.joined()))
    //print(arrr.reduce([]){$0 + $1})

    //class Author {
    //    var book: Book?
    //}
    //class Book {
    //    var noOfPages = 100
    //}
    //let dd = Author()
    //dd.book = Book()
    //
    //var pages: Int = dd.book!.noOfPages
    //print(pages)
    //
    //dd.book = nil
    //pages = dd.book?.noOfPages


    //var ddf = "07:40"
    //var ddf2 = "08:40"
    //let sdc = ddf.split(separator: ":")
    //let sdc2 = ddf2.split(separator: ":")
    //let d1 = Int(sdc[0])!
    //let d2 = Int(sdc2[0])!
    //let dd4 = abs(d1-d2)
    //print(dd4)

    //testFrequency()
    //testFrequency2()

    //let dd = [12,4,2,3]
    //let dfg = dd[0..<7]
    ////print(dfg)

    //letSee()

    //testSetSubtractingOperation()

    //let dict: [Int: String] = [1: "one", 2: "two", 4: "four"]
    //
    //let dd = dict.values.firstIndex(of: "one")
    //print(dd)
    //
    //let gg = dict.firstIndex(where: {$0.value == "one"})
    //let ff = dict[gg!].key
    //print(ff)




    //testD()

    //var viewModel: MyViewModel? = MyViewModel()
    //viewModel?.myFunct()
    //viewModel = nil



    //dd = nil

    //var abtes:ABTest? = ABTest()
    //abtes?.start()
    //abtes = nil


    //testContact()

    //let ff = FisrtClass()
    //ff.star()

    //let res = 230.formattedWithSeparator
    //print(res)

    //let dd = sortDuplicates(arr: [1,1,3,5,5,3,2,1,4,3,3,5,5,4])
    //print(dd)

    //var stack = [Int]()
    //stack.last
    //

    //let res = numberOfPatches("XXX.XXXX")
    //print(res)


    sampleSinglLinkedListUsage()

    //isLinkedListEven()

    //let myClassA = DIContainer().createMyClasssA()
    //myClassA.doSomething()

    //let ff = Lapo()
    //ff.someGuy()

    //let rr = minimumOperations([2, 1, 2, 3, 3, 4, 3])
    //print(rr)

    //protocol Coordinator: AnyObject {
    //    var childCoordinators: [Coordinator] { get set }
    //    func start()
    //}
    //extension Coordinator {
    //
    //    func store(coordinator: Coordinator) {
    //        childCoordinators.append(coordinator)
    //        print("they are \(childCoordinators)")
    //    }
    //
    //    func free(coordinator: Coordinator) {
    //        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    //    }
    //}
    //class BaseCoordinator : Coordinator {
    //    var childCoordinators : [Coordinator] = []
    //    var isCompleted: (() -> ())?
    //
    //    func start() {
    //        fatalError("Children should implement `start`.")
    //    }
    //}
    //
    //class DIContainerr {
    //    static let shared = DIContainerr()
    //
    //    init() {}
    //
    //    func makeCO() ->  SampleCoordinator {
    //        print("From Prod")
    //        return SampleCoordinator()
    //    }
    //}
    //class MockDIContainer: DIContainerr {
    //    static let mockshared = MockDIContainer()
    //
    //    override func makeCO() -> SampleCoordinator {
    //        print("From dev")
    //        return SampleCoordinator()
    //    }
    //}
    //
    //class SampleCoordinator: BaseCoordinator {
    //
    //    override func start() {
    //
    //    }
    //}
    //class AppFlowCoordinator: BaseCoordinator {
    //    let di: DIContainerr
    //    init(di: DIContainerr) {
    //        self.di = di
    //    }
    //    override func start() {
    //        let dd = di.makeCO()
    //        store(coordinator: dd)
    //    }
    //}
    //
    //let asd1 = AppFlowCoordinator(di: DIContainerr.shared)
    //asd1.start()
    //let asd2 = AppFlowCoordinator(di: MockDIContainer.mockshared)
    //asd2.start()
    //
    //var dde = [2,3,4]
    //var tt = dde.reduce(0,+)


    //print("ans is \(calPoint(["5","2","C","D","+"]))")

    //print("ans is \(isValidParenthesis("(){}{}"))")
    //print("ans2 is \(isValidParenthesis("([){}"))")

    //let dd = Solution()
    //
    //
    //
    //let treeNode15 = TreeNode.init(15)
    //let treeNode7 = TreeNode.init(7)
    //let treeNode20 = TreeNode.init(20, treeNode15, treeNode7)
    //let treeNode9 = TreeNode.init(9)
    //let rootNode = TreeNode.init(3, treeNode9, treeNode20)
    //var ans = dd.averageOfLevels(rootNode)


    //let rr = findMajorityElement(nums: [1,1,1,1,1,2,3,4,1])
    //print(rr)


    //print(Int(sqrt(5)))
    func gcd(firstNum: Int, secondNum: Int) -> Int {
        if firstNum == 0 {
            return secondNum
        }
        return gcd(firstNum: (secondNum % firstNum), secondNum: firstNum)
    }

    func numberOfCommonFactors(firstNum: Int, secondNum: Int) {
        var gcd: Int = gcd(firstNum: firstNum, secondNum: secondNum)
        let gcdDouble: Double = sqrt(Double(gcd))
        var gcdNum = Int(gcdDouble) + 1
        print(gcdNum)
        var num = 1
        var res = 0
        while num <= gcdNum {
            if gcd % num == 0 {

                if (gcd / num) == num {
                    res = res + 1
                }
                else {
                    res = res + 2
                }
            }
            num = num + 1
        }
        print(res)
    }

    //let numString = readLine()!.split(separator: " ")
    //numberOfCommonFactors(firstNum: Int(numString.first!)!, secondNum: Int(numString.last!)!)

    //var secondSample: SecondSample? = SecondSample()
    //var sample: Sample? = Sample(secondSample: secondSample!)
    //secondSample?.sample = sample
    //secondSample?.sample = nil
    ////secondSample = nil
    //sample = nil

    //testCode()

    //var sampleDic: [AnyHashable: Any] = ["aa": "Book"]
    //
    //if let asn = sampleDic["aa"] as? String {
    //    let myNewString = asn.replacingOccurrences(of: "\"", with: "")
    //    print("Sum of x and y \(myNewString)")
    //}
    ////asn = asn?.replacingOccurrences(of: "\"\"", with: "")
    //var asn = sampleDic["aa"] as? String
    //let myNewString = asn?.replacingOccurrences(of: "\"", with: "")
    //print("Sum of x and y \(myNewString!)")

    //let ads = Multithreading_001()
    //ads.startOperation()

    //let queue = DispatchQueue(label: "DispatchQueue", attributes: .concurrent)
    //
    //print("welcome")
    //queue.async {
    //    for n in 0..<5 {
    //        sleep(20)
    //        print("Queue async without barrier \(n)")
    //    }
    //}

    let graph = setupGraphwith(edges: [[1,2,4], [1,3,4], [3,4,3], [2,3,2], [3,5,1], [4,6,2], [5,6,3], [3,6,6] ])
    let moreComplexGraph = setupGraphwith(edges: [[0,1,4],[0,2,4],[1,2,2],[1,4,7],[2,3,3],[2,4,1],[2,5,6],[3,5,2],[4,5,3]])
    let graphWithBug = setupGraphwith(edges: [[1,2,10],[1,3,1],[3,2,1]])
    let graphAllNodes = setupGraphwith(edges: [[1,4,20],[3,1,3],[4,3,12]])
    let res = shortestPath2(source: 1, destination: 6, graph: graph)
    print("res is \(res)")

    let res2  = shortestPath2(source: 0, destination: 5, graph: moreComplexGraph)
    let res3 = shortestPath2(source: 1, destination: 2, graph: graphWithBug)

    print("res2 is \(res2)")

    print("res3 is \(res3)")


}
