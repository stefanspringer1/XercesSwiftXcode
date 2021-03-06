# XercesSwiftXcode: Xerces binding for Swift as Xcode project (experimental)

This is an experimental project in the form of an Xcode project that uses the [Xerces-C++ XML parser](https://xerces.apache.org/xerces-c/) as an XML parser. Why Xerces? Xerces is an important parser for XML, e.g. Java comes with a Java version of it, and libxml2 does not fully support W3C schema for validation, but Xerces does.

The project includes a (very incomplete) binding to Xerces in form of a SAX-like interface. As the C++ binding to Swift is not ready yet for production, it uses Objective-C as an intermediate for the binding. Xerces-C++ is included here in compiled form as a dynamic library for macOS (Intel). Replace this library by one for your platform form [XercesBuild](https://github.com/stefanspringer1/XercesBuild), or, If you do not want to one of those this binaries, please see the same repository for build instructions for Xerces-C++ or go directly to the [Xerces-C++ XML parser website](https://xerces.apache.org/xerces-c/). The following `main.swift` is included in the project that succesfully executes:

```swift
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
```

Given the path to an XML file as the argument, it prints the element names for each element it encounters while parsing.

(Note that the inclusion of the C++ header files from Xerces-C++ is better solved in the repository [XercesSwift](https://github.com/stefanspringer1/XercesSwift).)

The goal is just to use Xerces as a parser in a SAX-like manner including validation during parsing (according to a DTD or a W3C schema, less Relax NG for which libxml2 would be a better choice), not using any DOM built by Xerces. Of course, to make this binding to Xerces-C++ usable in practice, some more work would be necessary:

- Make the binding more complete.
- Make the C++ API of the binding more appropriate (currently it just a textual argument-passing API on the C++ level, which stems from a simple C++ SAX parsing example).
- Maybe avoid having all those include files from Xerces somehow?
- Maybe include the whole Xerces source code and let Xerces be built as part of the project?
- Make a separate package with just the statemant of the SAX interface (class `XMLParseConsumer` in the above code) to be able to easily switch parsers in a project (e.g. be able to switch form Xerces to libxml2 or the way around). 

But **the first next step** should be to make a project for the **Swift Package Manager** from it. For this, the following repository exists, which is a Swift package, but not runnable yet: [XercesSwift](https://github.com/stefanspringer1/XercesSwift).

---

Legal notice: Usage of any of the included material is to your own risk. The Xerces-C++ source is from [https://xerces.apache.org/xerces-c/](https://xerces.apache.org/xerces-c/) and is used under the Apache 2 license.