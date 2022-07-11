#include "acs.h"
#include "acs230.h"

static AUSERBLK230 button = { A_3Dbutton, 0x29129170L, Auo_string, NULL, NULL, NULL };

static OBJECT keys[] = {
	{  -1,  1, 256, G_USERDEF, 0, 0x0010, C_UNION(&button), 0, 0, 32, 8 },
	{   2, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x20001101L), 0, 0, 1, 1 },
	{   3, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x01001101L), 1, 0, 1, 1 },
	{   4, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x02001101L), 2, 0, 1, 1 },
	{   5, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x03001101L), 3, 0, 1, 1 },
	{   6, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x04001101L), 4, 0, 1, 1 },
	{   7, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x05001101L), 5, 0, 1, 1 },
	{   8, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x06001101L), 6, 0, 1, 1 },
	{   9, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 7, 0, 1, 1 },
	{  10, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 8, 0, 1, 1 },
	{  11, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 9, 0, 1, 1 },
	{  12, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 10, 0, 1, 1 },
	{  13, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 11, 0, 1, 1 },
	{  14, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 12, 0, 1, 1 },
	{  15, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 13, 0, 1, 1 },
	{  16, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 14, 0, 1, 1 },
	{  17, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 15, 0, 1, 1 },
	{  18, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 16, 0, 1, 1 },
	{  19, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 17, 0, 1, 1 },
	{  20, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 18, 0, 1, 1 },
	{  21, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 19, 0, 1, 1 },
	{  22, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 20, 0, 1, 1 },
	{  23, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 21, 0, 1, 1 },
	{  24, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 22, 0, 1, 1 },
	{  25, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 23, 0, 1, 1 },
	{  26, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 24, 0, 1, 1 },
	{  27, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 25, 0, 1, 1 },
	{  28, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 26, 0, 1, 1 },
	{  29, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 27, 0, 1, 1 },
	{  30, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 28, 0, 1, 1 },
	{  31, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 29, 0, 1, 1 },
	{  32, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x1e001101L), 30, 0, 1, 1 },
	{  33, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x1f001101L), 31, 0, 1, 1 },
	{  34, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x20001101L), 0, 1, 1, 1 },
	{  35, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x21001101L), 1, 1, 1, 1 },
	{  36, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x22001101L), 2, 1, 1, 1 },
	{  37, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x23001101L), 3, 1, 1, 1 },
	{  38, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x24001101L), 4, 1, 1, 1 },
	{  39, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x25001101L), 5, 1, 1, 1 },
	{  40, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 6, 1, 1, 1 },
	{  41, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 7, 1, 1, 1 },
	{  42, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 8, 1, 1, 1 },
	{  43, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 9, 1, 1, 1 },
	{  44, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 10, 1, 1, 1 },
	{  45, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 11, 1, 1, 1 },
	{  46, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 12, 1, 1, 1 },
	{  47, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 13, 1, 1, 1 },
	{  48, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 14, 1, 1, 1 },
	{  49, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 15, 1, 1, 1 },
	{  50, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 16, 1, 1, 1 },
	{  51, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 17, 1, 1, 1 },
	{  52, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 18, 1, 1, 1 },
	{  53, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 19, 1, 1, 1 },
	{  54, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 20, 1, 1, 1 },
	{  55, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 21, 1, 1, 1 },
	{  56, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 22, 1, 1, 1 },
	{  57, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 23, 1, 1, 1 },
	{  58, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 24, 1, 1, 1 },
	{  59, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 25, 1, 1, 1 },
	{  60, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 26, 1, 1, 1 },
	{  61, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 27, 1, 1, 1 },
	{  62, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 28, 1, 1, 1 },
	{  63, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 29, 1, 1, 1 },
	{  64, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x3e001101L), 30, 1, 1, 1 },
	{  65, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x3f001101L), 31, 1, 1, 1 },
	{  66, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x40001101L), 0, 2, 1, 1 },
	{  67, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x41001101L), 1, 2, 1, 1 },
	{  68, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x42001101L), 2, 2, 1, 1 },
	{  69, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x43001101L), 3, 2, 1, 1 },
	{  70, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x45001101L), 4, 2, 1, 1 },
	{  71, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x46001101L), 5, 2, 1, 1 },
	{  72, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x47001101L), 6, 2, 1, 1 },
	{  73, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x48001101L), 7, 2, 1, 1 },
	{  74, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x49001101L), 8, 2, 1, 1 },
	{  75, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x4a001101L), 9, 2, 1, 1 },
	{  76, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x4c001101L), 10, 2, 1, 1 },
	{  77, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x4d001101L), 11, 2, 1, 1 },
	{  78, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x4e001101L), 12, 2, 1, 1 },
	{  79, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x4f001101L), 13, 2, 1, 1 },
	{  80, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 14, 2, 1, 1 },
	{  81, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 15, 2, 1, 1 },
	{  82, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 16, 2, 1, 1 },
	{  83, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 17, 2, 1, 1 },
	{  84, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 18, 2, 1, 1 },
	{  85, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 19, 2, 1, 1 },
	{  86, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 20, 2, 1, 1 },
	{  87, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 21, 2, 1, 1 },
	{  88, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 22, 2, 1, 1 },
	{  89, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 23, 2, 1, 1 },
	{  90, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 24, 2, 1, 1 },
	{  91, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 25, 2, 1, 1 },
	{  92, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 26, 2, 1, 1 },
	{  93, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 27, 2, 1, 1 },
	{  94, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 28, 2, 1, 1 },
	{  95, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 29, 2, 1, 1 },
	{  96, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x5e001101L), 30, 2, 1, 1 },
	{  97, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x5f001101L), 31, 2, 1, 1 },
	{  98, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x60001101L), 0, 3, 1, 1 },
	{  99, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 1, 3, 1, 1 },
	{ 100, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 2, 3, 1, 1 },
	{ 101, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x63001101L), 3, 3, 1, 1 },
	{ 102, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x64001101L), 4, 3, 1, 1 },
	{ 103, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x65001101L), 5, 3, 1, 1 },
	{ 104, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x66001101L), 6, 3, 1, 1 },
	{ 105, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x67001101L), 7, 3, 1, 1 },
	{ 106, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x68001101L), 8, 3, 1, 1 },
	{ 107, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x69001101L), 9, 3, 1, 1 },
	{ 108, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x6a001101L), 10, 3, 1, 1 },
	{ 109, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x6b001101L), 11, 3, 1, 1 },
	{ 110, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x6c001101L), 12, 3, 1, 1 },
	{ 111, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x6d001101L), 13, 3, 1, 1 },
	{ 112, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x6e001101L), 14, 3, 1, 1 },
	{ 113, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x6f001101L), 15, 3, 1, 1 },
	{ 114, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x70001101L), 16, 3, 1, 1 },
	{ 115, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 17, 3, 1, 1 },
	{ 116, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 18, 3, 1, 1 },
	{ 117, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 19, 3, 1, 1 },
	{ 118, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 20, 3, 1, 1 },
	{ 119, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 21, 3, 1, 1 },
	{ 120, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 22, 3, 1, 1 },
	{ 121, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 23, 3, 1, 1 },
	{ 122, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 24, 3, 1, 1 },
	{ 123, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 25, 3, 1, 1 },
	{ 124, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 26, 3, 1, 1 },
	{ 125, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 27, 3, 1, 1 },
	{ 126, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 28, 3, 1, 1 },
	{ 127, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 29, 3, 1, 1 },
	{ 128, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x7e001101L), 30, 3, 1, 1 },
	{ 129, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x7f001101L), 31, 3, 1, 1 },
	{ 130, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x80001101L), 0, 4, 1, 1 },
	{ 131, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x81001101L), 1, 4, 1, 1 },
	{ 132, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 2, 4, 1, 1 },
	{ 133, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 3, 4, 1, 1 },
	{ 134, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 4, 4, 1, 1 },
	{ 135, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 5, 4, 1, 1 },
	{ 136, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 6, 4, 1, 1 },
	{ 137, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 7, 4, 1, 1 },
	{ 138, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 8, 4, 1, 1 },
	{ 139, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 9, 4, 1, 1 },
	{ 140, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 10, 4, 1, 1 },
	{ 141, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 11, 4, 1, 1 },
	{ 142, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 12, 4, 1, 1 },
	{ 143, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 13, 4, 1, 1 },
	{ 144, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 14, 4, 1, 1 },
	{ 145, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 15, 4, 1, 1 },
	{ 146, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 16, 4, 1, 1 },
	{ 147, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 17, 4, 1, 1 },
	{ 148, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 18, 4, 1, 1 },
	{ 149, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 19, 4, 1, 1 },
	{ 150, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 20, 4, 1, 1 },
	{ 151, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 21, 4, 1, 1 },
	{ 152, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 22, 4, 1, 1 },
	{ 153, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 23, 4, 1, 1 },
	{ 154, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 24, 4, 1, 1 },
	{ 155, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 25, 4, 1, 1 },
	{ 156, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 26, 4, 1, 1 },
	{ 157, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 27, 4, 1, 1 },
	{ 158, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 28, 4, 1, 1 },
	{ 159, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 29, 4, 1, 1 },
	{ 160, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 30, 4, 1, 1 },
	{ 161, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 31, 4, 1, 1 },
	{ 162, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0xa0001101L), 0, 5, 1, 1 },
	{ 163, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0xa1001101L), 1, 5, 1, 1 },
	{ 164, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 2, 5, 1, 1 },
	{ 165, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 3, 5, 1, 1 },
	{ 166, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 4, 5, 1, 1 },
	{ 167, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 5, 5, 1, 1 },
	{ 168, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 6, 5, 1, 1 },
	{ 169, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 7, 5, 1, 1 },
	{ 170, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 8, 5, 1, 1 },
	{ 171, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 9, 5, 1, 1 },
	{ 172, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 10, 5, 1, 1 },
	{ 173, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 11, 5, 1, 1 },
	{ 174, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 12, 5, 1, 1 },
	{ 175, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 13, 5, 1, 1 },
	{ 176, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 14, 5, 1, 1 },
	{ 177, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 15, 5, 1, 1 },
	{ 178, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 16, 5, 1, 1 },
	{ 179, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 17, 5, 1, 1 },
	{ 180, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 18, 5, 1, 1 },
	{ 181, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 19, 5, 1, 1 },
	{ 182, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 20, 5, 1, 1 },
	{ 183, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 21, 5, 1, 1 },
	{ 184, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 22, 5, 1, 1 },
	{ 185, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 23, 5, 1, 1 },
	{ 186, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 24, 5, 1, 1 },
	{ 187, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 25, 5, 1, 1 },
	{ 188, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 26, 5, 1, 1 },
	{ 189, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 27, 5, 1, 1 },
	{ 190, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 28, 5, 1, 1 },
	{ 191, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 29, 5, 1, 1 },
	{ 192, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 30, 5, 1, 1 },
	{ 193, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 31, 5, 1, 1 },
	{ 194, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0xc0001101L), 0, 6, 1, 1 },
	{ 195, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0xc1001101L), 1, 6, 1, 1 },
	{ 196, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 2, 6, 1, 1 },
	{ 197, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 3, 6, 1, 1 },
	{ 198, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 4, 6, 1, 1 },
	{ 199, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 5, 6, 1, 1 },
	{ 200, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 6, 6, 1, 1 },
	{ 201, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 7, 6, 1, 1 },
	{ 202, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 8, 6, 1, 1 },
	{ 203, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 9, 6, 1, 1 },
	{ 204, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 10, 6, 1, 1 },
	{ 205, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 11, 6, 1, 1 },
	{ 206, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 12, 6, 1, 1 },
	{ 207, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 13, 6, 1, 1 },
	{ 208, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 14, 6, 1, 1 },
	{ 209, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 15, 6, 1, 1 },
	{ 210, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 16, 6, 1, 1 },
	{ 211, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 17, 6, 1, 1 },
	{ 212, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 18, 6, 1, 1 },
	{ 213, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 19, 6, 1, 1 },
	{ 214, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 20, 6, 1, 1 },
	{ 215, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 21, 6, 1, 1 },
	{ 216, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 22, 6, 1, 1 },
	{ 217, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 23, 6, 1, 1 },
	{ 218, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 24, 6, 1, 1 },
	{ 219, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 25, 6, 1, 1 },
	{ 220, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 26, 6, 1, 1 },
	{ 221, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 27, 6, 1, 1 },
	{ 222, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 28, 6, 1, 1 },
	{ 223, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 29, 6, 1, 1 },
	{ 224, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 30, 6, 1, 1 },
	{ 225, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 31, 6, 1, 1 },
	{ 226, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0xe0001101L), 0, 7, 1, 1 },
	{ 227, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0xe1001101L), 1, 7, 1, 1 },
	{ 228, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 2, 7, 1, 1 },
	{ 229, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 3, 7, 1, 1 },
	{ 230, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 4, 7, 1, 1 },
	{ 231, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 5, 7, 1, 1 },
	{ 232, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 6, 7, 1, 1 },
	{ 233, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 7, 7, 1, 1 },
	{ 234, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 8, 7, 1, 1 },
	{ 235, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 9, 7, 1, 1 },
	{ 236, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 10, 7, 1, 1 },
	{ 237, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 11, 7, 1, 1 },
	{ 238, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 12, 7, 1, 1 },
	{ 239, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 13, 7, 1, 1 },
	{ 240, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 14, 7, 1, 1 },
	{ 241, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 15, 7, 1, 1 },
	{ 242, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 16, 7, 1, 1 },
	{ 243, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 17, 7, 1, 1 },
	{ 244, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 18, 7, 1, 1 },
	{ 245, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 19, 7, 1, 1 },
	{ 246, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 20, 7, 1, 1 },
	{ 247, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 21, 7, 1, 1 },
	{ 248, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 22, 7, 1, 1 },
	{ 249, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 23, 7, 1, 1 },
	{ 250, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 24, 7, 1, 1 },
	{ 251, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 25, 7, 1, 1 },
	{ 252, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 26, 7, 1, 1 },
	{ 253, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 27, 7, 1, 1 },
	{ 254, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 28, 7, 1, 1 },
	{ 255, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x62001101L), 29, 7, 1, 1 },
	{ 256, -1, -1, G_BOXCHAR, 0x0005, 0x0000, C_UNION(0x61001101L), 30, 7, 1, 1 },
	{   0, -1, -1, G_BOXCHAR, 0x0025, 0x0000, C_UNION(0x62001101L), 31, 7, 1, 1 },
	
};

static void (*oldkey)(int16 *kstate, int16 *key);

static void mykey(int16 *kstate, int16 *key)
{
	int ret;
	
	if ((char)*key == NK_INS)
	{
		ret = Ame_popup(Awi_root(), keys, -1, -1);
		if (ret > 0)
		{
			*kstate = 0;
			*key = ret - 1;
		}
	}
	oldkey(kstate, key);
}


int16 ACSinit(void)
{
	int16 i;
	OBJECT *ptr;
	
	oldkey = ACSblk->ACSkey;
	ACSblk->ACSkey = mykey;
	for (ptr = &keys[1], i = 0; i < 256; ptr++, i++)
		ptr->ob_spec.obspec.character = i;
	return OK;
}
