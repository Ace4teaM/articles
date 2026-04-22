#pragma once
#include <vector>

class Type
{
public:
	static std::vector<Type*>& GetTypes();
	static std::vector<Type*> g_types;
};

