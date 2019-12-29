import Foundation

let requestParameterKey = "com.redalemeden.swift-express.parameter"

public func parseParameters(request: Request,
                        response: Response,
                        next: @escaping Next) {
  if let queryItems = URLComponents(string: request.header.uri)?.queryItems {
    request.userInfo[requestParameterKey] = Dictionary(grouping: queryItems, by: { $0.name })
      .mapValues {
        $0.compactMap({ $0.value })
          .joined(separator: ",")
      }
  }

  next()
}
