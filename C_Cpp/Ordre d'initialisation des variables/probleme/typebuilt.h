#pragma once
#include "type.h"

class TypeBuilt : public Type
{
public:
	TypeBuilt(const char* name);

	static TypeBuilt typeA;
	static TypeBuilt typeB;
	static TypeBuilt typeC;
	static TypeBuilt typeD;
};
