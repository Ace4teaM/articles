# Problème de compilation MAXSDK sous VisualStudio

	unresolved external symbol "public: virtual wchar_t * __thiscall ClassDesc::GetRsrcString(int)" ...


Vous avez une erreur de compilation semblable à celle-ci:

	1>------ Build started: Project: mshexp, Configuration: Debug Win32 ------
	1>Build started 17/07/2011 21:06:21.
	1>InitializeBuildStatus:
	1> Touching "Debug\mshexp.unsuccessfulbuild".
	1>ClCompile:
	1> main.cpp
	1>Link:
	1> Creating library D:\Id-Informatik\dev\nplib\nplib_1_0\tools\3dsmax\mshexp\Debug\mshexp.lib and object D:\Id-Informatik\dev\nplib\nplib_1_0\tools\3dsmax\mshexp\Debug\mshexp.exp
	1>mshexp.exp : warning LNK4070: /OUT:npmshexp.dll directive in .EXP differs from output filename 'D:\Id-Informatik\dev\nplib\nplib_1_0\tools\3dsmax\mshexp\Debug\mshexp.dll'; ignoring directive
	1>main.obj : error LNK2001: unresolved external symbol "public: virtual wchar_t * __thiscall ClassDesc::GetRsrcString(int)" (?GetRsrcString@ClassDesc@@UAEPA_WH@Z)
	1>main.obj : error LNK2001: unresolved external symbol "public: virtual class FPInterface * __thiscall ClassDesc::GetInterface(wchar_t *)" (?GetInterface@ClassDesc@@UAEPAVFPInterface@@PA_W@Z)
	1>D:\Id-Informatik\dev\nplib\nplib_1_0\tools\3dsmax\mshexp\Debug\mshexp.dll : fatal error LNK1120: 2 unresolved externals
	1>
	1>Build FAILED.
	1>
	1>Time Elapsed 00:00:01.50
	========== Build: 0 succeeded, 1 failed, 0 up-to-date, 0 skipped ==========

Le problème vient surement de l'utilisation de l'encodage Unicode, définissez l'option suivante dans la configuration de votre projet:

	Configuration Properties => General => Character Set = "No Set"



--------------------------

Auteur: [Thomas AUGUEY](https://github.com/Ace4teaM)
