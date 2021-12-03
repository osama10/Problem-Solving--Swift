//import UIKit
//import Network
//
//class View: UIView {
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        guard  alpha >= 0.01
//                && !isHidden
//                && !isUserInteractionEnabled
//                && self.point(inside: point, with: event)
//        else { return nil }
//
//        for subview in subviews.reversed() {
//            let convertedPoint = subview.convert(point, from: self)
//            if let subview = subview.hitTest(convertedPoint, with: event) {
//                return subview
//            }
//        }
//
//        return self
//    }
//
//}
//
//typealias Parameters = [String: String]
//typealias Headers = [String: String]
//
//enum RequestMethod: String {
//    case get, post, put, delete
//
//    var method: String {
//        self.rawValue.uppercased()
//    }
//}
//
//protocol EndpointProtocol {
//    var baseUrl: String { get }
//    var absolutePath: String { get }
//    var parameter: Parameters { get }
//    var header: Headers { get }
//    var method: RequestMethod { get }
//}
//
//enum NetworkingError: Int, Error {
//
//    case noIntertnet = -1009
//    case resourceNotFound = 404
//    case badRequest = 400
//    case tooManyRequests = 429
//    case serverError = 500
//    case unableToDecode
//    case unknown
//
//    var errorMesage: String {
//        switch self {
//        case .noIntertnet:
//            return "You are not connected to internet"
//        case .resourceNotFound, .badRequest, .unknown, .serverError, .unableToDecode, .tooManyRequests:
//            return "Ooops! Something went wrong. Please try later."
//        }
//    }
//
//}
//
//
//
//protocol Networking {
//    func get<T:Decodable>(endpoint: EndpointProtocol,
//                          response: @escaping ((Result<T,NetworkingError>) -> Void))
//    //    func delete<T:Decodable>(endpoint: EndpointProtocol,
//    //                          response: @escaping ((Result<T,NetworkingError>) -> Void))
//    //    func put<T:Decodable>(endpoint: EndpointProtocol,
//    //                          response: @escaping ((Result<T,NetworkingError>) -> Void))
//    //    func post<T:Decodable>(endpoint: EndpointProtocol,
//    //                          response: @escaping ((Result<T,NetworkingError>) -> Void))
//}
//
//
//final class NetworkingManager: Networking {
//    let session: URLSession
//
//    init(session: URLSession = URLSession.shared) {
//        self.session = session
//    }
//
//    func get<T>(endpoint: EndpointProtocol, response: @escaping ((Result<T, NetworkingError>) -> Void)) where T : Decodable {
//        guard let request = performRequest(for: endpoint)
//        else {
//            response(.failure(.badRequest))
//            return
//        }
//
//        session.dataTask(with: request) { data, response, error in
//
//
//        }
//    }
//
//    private func performRequest(for endpoint: EndpointProtocol) -> URLRequest? {
//        let requestURL = endpoint.baseUrl + endpoint.absolutePath
//        guard var urlComponents = URLComponents(string: requestURL) else {
//            return nil
//        }
//
//        urlComponents.queryItems = endpoint.parameter.compactMap({ param -> URLQueryItem in
//            return URLQueryItem(name: param.key, value: param.value)
//        })
//
//        guard let url = urlComponents.url else { return nil }
//
//        var urlRequest = URLRequest(url: url,
//                                    cachePolicy: .reloadRevalidatingCacheData,
//                                    timeoutInterval: 30)
//        urlRequest.httpMethod = endpoint.method.method
//        endpoint.header.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
//
//        return urlRequest
//    }
//
//}


//typealias Info = (node: String, request: Int, mutexId: String)
//func detectDeadlock(_ data:[Info]) -> Int {
//    var acquired = [String: String]()
//    var waitingList = [String: [String]]()
//
//    var graph = [String: Set<String>]()
//
//    for info in data {
//        if info.request == 1 {
//            acquired[info.mutexId] = nil
//            graph[info.node, default: Set<String>()].remove(info.mutexId)
//
//            if var candidates = waitingList[info.mutexId],
//                !candidates.isEmpty{
//                graph[candidates.removeFirst(), default: Set<String>()].insert(info.mutexId)
//                waitingList[info.mutexId] = candidates
//            }
//
//        } else {
//            if acquired[info.mutexId] != nil {
//                graph[info.mutexId, default: Set<String>()].insert(info.node)
//                waitingList[info.mutexId, default: []].append(info.node)
//            } else {
//                graph[info.node, default: Set<String>()].insert(info.mutexId)
//            }
//
//        }
//
//        // do dfs
//    }
//
//    return -1
//}


//var index = 0
//
//func calculate(_ s: String) -> Int {
//    evaluateExpression(Array(s.replacingOccurrences(of: " ", with: "")))
//}
//
//func evaluateExpression(_ expression: [Character]) -> Int {
//    guard index < expression.count else { return 0 }
//    var number = 0
//    var operand = 1
//    var result = 0
//
//    while index < expression.count {
//        let char = expression[index]
//        index += 1
//        if char.isNumber {
//            number = number * 10 + Int(String(char))!
//        } else if char == "("{
//            number = evaluateExpression(expression)
//        } else if char == ")" {
//            break
//        } else {
//            result += number * operand
//            number = 0
//            operand = char == "+" ? 1 : -1
//        }
//    }
//
//    return result + (number * operand)
//}

//func braceExpansionII(_ expression: String) -> [String] {
//            []
//}
//
//func expandExpression(_ expression: [Character]) -> Set<String> {
//    var curr = Set<String>()
//    var result = Set<String>()
//
//    while index < expression.count {
//        let char = expression[index]
//
//        if char.isLetter {
//            let letters = parseLetters(expression)
//            if curr.isEmpty {
//                curr.insert(letters)
//            } else {
//
//            }
//        }
//    }
//}
//
//func parseLetters(_ expression: [Character]) -> String {
//    var result = ""
//
//    while index < expression.count && expression[index].isLetter {
//        result.append(expression[index])
//        index += 1
//    }
//
//    return result
//}

//var index = 0
//
//func braceExpansionII(_ expression: String) -> [String] {
//    Array(parse(Array(expression))).sorted()
//}
//
//func parse(_ expression: [Character]) -> Set<String> {
//    var curr = Set<String>()
//    var res = Set<String>()
//
//    while index < expression.count {
//        let char = expression[index]
//
//        if char.isLetter {
//            let str = parseChar(expression)
//            if curr.isEmpty {
//                curr.insert(str)
//            } else {
//                curr = product(curr, [str])
//            }
//            //index += 1
//
//        } else if char == "{" {
//            index += 1
//            let result = parse(expression)
//            if curr.isEmpty {
//                curr = result
//            } else {
//                curr = product(curr, result)
//            }
//        } else if char == "}" {
//            index += 1
//            break
//        } else {
//            res = res.union(curr)
//            index += 1
//            curr = Set()
//        }
//    }
//
//    return res
//}
//
//
//func product(_ set1: Set<String>, _ set2: Set<String>) -> Set<String> {
//    var product = Set<String>()
//
//    for val1 in set1 {
//        for val2 in set2 {
//            product.insert(val1 + val2)
//        }
//    }
//    print(product)
//    return product
//}
//
//func parseChar(_ expression: [Character]) -> String {
//    var result = ""
//
//    while index < expression.count && expression[index].isLetter {
//        result.append(expression[index])
//        index += 1
//    }
//    //print(result)
//    return result
//}
//
//
//braceExpansionII("{a,b}{c,{d,e}}")

func mostVisitedPattern(_ username: [String], _ timestamp: [Int], _ website: [String]) -> [String] {
    var websiteScore = [String: Set<String>]()
    var userHistory = [String: [(String, Int)]]()
    
    for i in 0..<username.count {
        userHistory[username[i], default: []].append((website[i], timestamp[i]))
    }
    
    userHistory.forEach { (user,data) in
        userHistory[user]?.sort{ $0.1 < $1.1 }
    }
    
    print(userHistory)
    var pattern = [String]()
    
    for (user, data) in userHistory {
        patternCount(user, data, 0, &pattern, &websiteScore)
    }
    
    let result = websiteScore
        .sorted { $0.value.count > $1.value.count
            || $0.value.count == $1.value.count && $0.key < $1.key }
    
    return result[0].key
        .split(separator: "-")
        .map(String.init)
}

func patternCount(_ user: String ,_ websites: [(String, Int)], _ start: Int , _ pattern: inout [String],_ websiteScore: inout [String: Set<String>]) {
    if pattern.count == 3 {
        websiteScore[pattern.joined(separator: "-"), default: []].insert(user)
    } else {
        if start < websites.count {
            for index in start...websites.count-1 {
                pattern.append(websites[index].0)
                patternCount(user, websites, index + 1, &pattern, &websiteScore)
                pattern.removeLast()
            }
        }
    }
}


mostVisitedPattern(["h","eiy","cq","h","cq","txldsscx","cq","txldsscx","h","cq","cq"],[527896567,334462937,517687281,134127993,859112386,159548699,51100299,444082139,926837079,317455832,411747930],
                   ["hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","yljmntrclw","hibympufi","yljmntrclw"]
)
