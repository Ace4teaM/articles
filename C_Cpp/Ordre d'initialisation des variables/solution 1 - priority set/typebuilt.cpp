#include "typebuilt.h"

#ifdef _MSC_VER
#pragma warning(disable : 4073)
#pragma init_seg(lib)
#define INIT 
#else
#define INIT __attribute__((init_priority(200)))
#endif

TypeBuilt::TypeBuilt(const char* name)
{
	Type::GetTypes().push_back(this);
}

INIT TypeBuilt TypeBuilt::typeA("A");
INIT TypeBuilt TypeBuilt::typeB("B");
INIT TypeBuilt TypeBuilt::typeC("C");

