#include "XercesSwift.hpp"
#include "SAXPrint.hpp"
#include <vector>
#include <string>

char *convert(const std::string & s)
{
   char *pc = new char[s.size()+1];
   std::strcpy(pc, s.c_str());
   return pc;
}

int XercesSwift::parse(char* path, void* parseConsumer, void(*f)(void*,void*,int)) {
    std::vector<std::string> args {
        "",
        path
    };
    std::vector<char*> cstrings;
    cstrings.reserve(args.size());

    for(size_t i = 0; i < args.size(); ++i)
        cstrings.push_back(const_cast<char*>(args[i].c_str()));
    if(!cstrings.empty()) {
        int result = xercesParse((int)cstrings.size(), &cstrings[0], parseConsumer, f);
        return result;
    }
    return -1;
}
