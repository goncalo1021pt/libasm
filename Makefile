NAME = libasm
LIB_NAME = libasm.a

SRCS_DIR = srcs/
OBJS_DIR = objs/
SRCS = $(wildcard srcs/*.s)
OBJS = $(addprefix $(OBJS_DIR),$(SRCS:$(SRCS_DIR)%.s=%.o))
HEADERS = -I includes/
HDRS = $(wildcard includes/*.h)

RM = rm -f
CFLAGS = -Wall -Wextra -Werror -g -o3
SFLAGS = -fsanitize=address
VFLAGS = --leak-check=full --show-leak-kinds=all --track-origins=yes --track-fds=yes #--suppressions="supression.supp"
CC = cc
COMPILER = nasm -f elf64
ARCH = ar rcs

#color codes
GREEN = \033[0;32m
RED = \033[0;31m
BLUE = \033[0;34m
ORANGE = \033[0;33m
NC = \033[0m

all: $(LIB_NAME)

$(OBJS_DIR)%.o: $(SRCS_DIR)%.s $(HDRS)
	@mkdir -p $(dir $@)
	@$(COMPILER) $< -o $@

$(LIB_NAME): $(OBJS)
	@echo "$(GREEN)$(NAME)$(NC) compiling..."
	@$(ARCH) $(LIB_NAME) $(OBJS)
	@echo "$(GREEN)$(NAME)$(NC) ready!"

$(BONUS_NAME): $(BONUS_OBJS)
	@$(CC) $(CFLAGS) -o $(BONUS_NAME) $(BONUS_OBJS) $(LIBFT)
	@echo $(BONUS_NAME)ready!

clean:
	@$(RM) -r $(OBJS_DIR)
	@$(RM) -r $(OBJS_DIR_BONUS)
	@echo "$(RED)$(NAME)$(NC) OBJS cleaned!"

fclean: clean
	@$(RM) $(NAME)
	@$(RM) $(LIB_NAME)
	@$(RM) $(BONUS_NAME)
	@echo "$(RED)$(NAME)$(NC) cleaned!"

v: re
	valgrind $(VFLAGS) ./$(NAME)

send: fclean
	git add . && git commit -m "auto" && git push

run: all
	@$(CC) $(CFLAGS) main.c $(LIB_NAME) -o $(NAME) $(HEADERS)
	./$(NAME)

re: fclean all

.PHONY: all fclean clean re v s fcount send run