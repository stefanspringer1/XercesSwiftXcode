#include <stdio.h>
#include <string>

class XercesSwift {
public:
    int parse(char* path, void* parseConsumer, void(*f)(void*,void*,int));
};
