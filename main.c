#include "libasm.h"

int main(void)
{
	const char *str = "Hello, World!";
	size_t len = ft_strlen(str);
	printf("The length of the string \"%s\" is %zu.\n", str, len);
	return 0;
}