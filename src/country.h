/*
 * For other localizations, change the COUNTRY code below
 * supported:
 * 0=english
 * 1=german
 */
#ifndef COUNTRY
#  define COUNTRY 1
#endif


#define COUNTRY_US 0
#define COUNTRY_DE 1

/*
 * ACS style selection of language
 */
#if COUNTRY == COUNTRY_DE
#  define ACS_LANG1
#endif
#if COUNTRY == COUNTRY_US
#  define ACS_LANG2
#endif
