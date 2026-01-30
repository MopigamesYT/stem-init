##
## EPITECH PROJECT, CURRENT_YEAR
## PROJECT_NAME
## File description:
## makefile
##

NAME = PROJECT_NAME
SRC = main.c

CC = clang
CFLAGS = -g3
LDFLAGS =

GREEN = \033[1;32m
CYAN = \033[1;36m
YELLOW = \033[1;33m
RED = \033[1;31m
MAGENTA = \033[1;35m
BOLD = \033[1m
RESET = \033[0m

OBJ = $(addprefix out/, $(SRC:.c=.o))

TEST_SRC = $(wildcard tests/*.c)
TEST_OBJ = $(addprefix out/, $(notdir $(TEST_SRC:.c=.o)))
TEST_NAME = unit_tests

all: $(OBJ)
	@$(CC) $(OBJ) -o $(NAME) $(LDFLAGS)
	@printf "  $(CYAN)󰌷 $(RESET) $(BOLD)%s$(RESET)\n" $(NAME)

out:
	@mkdir -p out

out/%.o: %.c | out
	@$(CC) $(CFLAGS) -c -o $@ $<
	@printf "  $(GREEN)󰆍 $(RESET) %s\n" $<

out/%.o: tests/%.c | out
	@$(CC) $(CFLAGS) -c -o $@ $<
	@printf "  $(GREEN)󰆍 $(RESET) %s\n" $<

clean:
	@rm -rf out
	@printf "  $(YELLOW)󰃢 $(RESET) objects\n"

fclean: clean
	@rm -rf $(NAME) $(TEST_NAME)
	@printf "  $(RED)󰩹 $(RESET) %s\n" $(NAME)

re: fclean all

debug: fclean $(OBJ)
	@$(CC) $(OBJ) -Wall -Werror -Wextra -g3 $(LDFLAGS) -o $(NAME)
	@printf "  $(MAGENTA)󰃤 $(RESET) $(BOLD)%s$(RESET)\n" $(NAME)

test: $(TEST_OBJ)
	@$(CC) $(TEST_OBJ) -o $(TEST_NAME) $(LDFLAGS) -lcriterion
	@printf "  $(CYAN)󰌷 $(RESET) $(BOLD)%s$(RESET)\n" $(TEST_NAME)
	@./$(TEST_NAME)

epiclang: fclean
	@$(MAKE) --no-print-directory CC=epiclang CFLAGS="-Werror" all
	@$(MAKE) --no-print-directory fclean

print-name:
	@echo $(NAME)

help:
	@printf "$(BOLD)Available targets:$(RESET)\n"
	@printf "  $(CYAN)all$(RESET)       Build $(NAME)\n"
	@printf "  $(CYAN)clean$(RESET)     Remove object files\n"
	@printf "  $(CYAN)fclean$(RESET)    Remove object files and binary\n"
	@printf "  $(CYAN)re$(RESET)        Rebuild $(NAME)\n"
	@printf "  $(CYAN)debug$(RESET)     Build with debug flags\n"
	@printf "  $(CYAN)test$(RESET)      Build and run unit tests\n"
	@printf "  $(CYAN)epiclang$(RESET)  Check with epiclang\n"
	@printf "  $(CYAN)help$(RESET)      Show this help\n"

.PHONY: all clean fclean re debug test epiclang print-name help
