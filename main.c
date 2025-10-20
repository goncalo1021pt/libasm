#include "libasm.h"

void ft_putnbr(int nb)
{
	if (nb == -2147483648)
	{
		ft_write(1, "-2147483648", 11);
		return ;
	}
	if (nb < 0)
	{
		ft_write(1, "-", 1);
		nb = -nb;
	}
	if (nb >= 10)
		ft_putnbr(nb / 10);
	char c = '0' + (nb % 10);
	ft_write(1, &c, 1);
}

int main(void)
{
	const char *str = "Hello, World!";
	char str2[] = "Test string";
	char str3[50] = "";
	char input_buf[100] = {0};
	char *dup_str;

	size_t len = ft_strlen(str);
	ft_write(1, "The length of the string: ", 26);
	ft_write(1, str, len);
	ft_write(1, " = ", 3);
	ft_putnbr(len);
	ft_write(1, "\n", 1);
	ft_strcpy(str3, str2);
	ft_write(1, "After ft_strcpy, str3 contains: ", 32);
	ft_write(1, str3, ft_strlen(str3));
	ft_write(1, "\n", 1);
	ft_write(1, "Comparing strings: ", 19);
	ft_write(1, str, len);
	ft_write(1, " and ", 5);
	ft_write(1, str2, ft_strlen(str2));
	ft_write(1, " => ", 4);
	ft_putnbr(ft_strcmp(str, str2));
	ft_write(1, "\n", 1);
	ft_write(1, "Comparing strings: ", 19);
	ft_write(1, str, len);
	ft_write(1, " and ", 5);
	ft_write(1, "Hello, World!", 13);
	ft_write(1, " => ", 4);
	ft_putnbr(ft_strcmp(str, "Hello, World!"));
	ft_write(1, "\n", 1);
	ft_write(1, "Enter some text: ", 17);
	ft_read(0, input_buf, 100);
	ft_write(1, "You entered: ", 13);
	ft_write(1, input_buf, ft_strlen(input_buf));
	dup_str = ft_strdup(str);
	ft_write(1, "Duplicated string: ", 19);
	ft_write(1, dup_str, ft_strlen(dup_str));
	ft_write(1, "\n", 1);
	free(dup_str);
	return 0;
}