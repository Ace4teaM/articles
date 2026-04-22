#include "typebuilt.h"
#include <iostream>
#include <assert.h>

int main()
{
	// Type::g_types.size() == 3
	// OK, car l'appel de Type::GetTypes() force l'initialisation du vecteur avant son utilisation
	assert(Type::GetTypes().size() == 3);
}
