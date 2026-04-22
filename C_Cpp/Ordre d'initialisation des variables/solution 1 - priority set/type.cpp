#include "type.h"

#ifdef _MSC_VER
#pragma warning(disable : 4073)
#pragma init_seg(lib)
#define INIT 
#else
#define INIT __attribute__((init_priority(200)))
#endif

INIT std::vector<Type*> Type::g_types;

std::vector<Type*>& Type::GetTypes()
{
	return g_types;
}
