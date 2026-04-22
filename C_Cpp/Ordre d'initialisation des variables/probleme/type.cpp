#include "type.h"

std::vector<Type*> Type::g_types;

std::vector<Type*>& Type::GetTypes()
{
	return g_types;
}
