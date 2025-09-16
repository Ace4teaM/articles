#include "typebuilt.h"
#include <iostream>
#include <assert.h>

int main()
{
	// Type::g_types.size() == 3
	// l'erreur est provoquée par l'ordre d'initialisation de TypeBuilt.cpp qui est prioritaire à Type.cpp (voir fichiers .cpp)
	assert(Type::GetTypes().size() == 3);
}
