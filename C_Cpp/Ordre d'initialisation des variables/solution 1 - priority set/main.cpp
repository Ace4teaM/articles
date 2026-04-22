#include "typebuilt.h"
#include <iostream>
#include <assert.h>

int main()
{
	// Type::g_types.size() == 3
	// OK, l'ordre d'initialisation de Type et identique à TypeBuilt (voir fichiers .cpp)
	assert(Type::GetTypes().size() == 3);
}
