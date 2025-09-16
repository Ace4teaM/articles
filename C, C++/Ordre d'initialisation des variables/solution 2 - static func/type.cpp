#include "type.h"

std::vector<Type*>& Type::GetTypes()
{
	static std::vector<Type*> g_types;// est initialisé avant son utilisation
	return g_types;
}
