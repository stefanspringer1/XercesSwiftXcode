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

let parseConsumer = MyXMLParseConsumer()
let parser = XercesParser(withParseConsumer: parseConsumer)
let returnCode = parser.parse(fromPath: "/Users/stefan/Projekte/SwiftXML/test.xml")
print("return code: \(returnCode)")
