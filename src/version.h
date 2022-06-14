#define ACS_VERSION_MAJOR 3
#define ACS_VERSION_MINOR 0
#define ACS_VERSION_MICRO 0

#define COPYRIGHT_YEAR 2003
#define BETA 1
#define RELEASE_DATE "Nov 12 2003"

#define ACS_VERSION ((ACS_VERSION_MAJOR * 100) + (ACS_VERSION_MINOR * 10) + (ACS_VERSION_MICRO))

#undef __STRING
#undef __STRINGIFY
#define __STRING(x)	#x
#define __STRINGIFY(x)	__STRING(x)
