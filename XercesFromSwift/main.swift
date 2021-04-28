//
//  main.swift
//  XercesFromSwift
//
//  Created by Stefan Springer on 06.04.21.
//

import Foundation

class MyXMLParseConsumer: XMLParseConsumer {
    
    override func startElement(name: String) {
        print("start element: \(name)")
    }
    
}

if CommandLine.arguments.count != 2 {
    print("ERROR: need exactly one argument = path XML file to parse")
}
else {
    let parseConsumer = MyXMLParseConsumer()
    let parser = XercesParser(withParseConsumer: parseConsumer)
    let returnCode = parser.parse(fromPath: CommandLine.arguments[1])
    print("return code: \(returnCode)")
}
