# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bmoll-pe <bmoll-pe@student.42bcn>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/10 04:23:57 by bmoll-pe          #+#    #+#              #
#    Updated: 2022/10/10 04:24:02 by bmoll-pe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ----------------------------- VAR DECLARATION ------------------------------ #

# Name value
NAME =			bmlib.a

# All the source of libft
SRC_LIB =		$(shell ls librarys/00_libft/*.c)

# All the source of ft_printf
SRC_PRI = 		$(shell ls librarys/01_ft_printf/ft_printf_bonus/*.c)

# All the source of gnl
SRC_GNL = 		$(shell ls librarys/gnl_for_bmlib/src/*.c)

# All the objects of libft
OBJS_LIB =		$(SRC_LIB:.c=.o)

# All the objects of ft_printf
OBJS_PRI =		$(SRC_PRI:.c=.o)

# All the objects of gnl
OBJS_GNL =		$(SRC_GNL:.c=.o)

# Header of bmlib
HEAD_BMLIB =	bmlib.h

# Header of libft
HEAD_LIB =		$(shell ls librarys/00_libft/*.h)

# Header of ft_printf
HEAD_PRF =		$(shell ls librarys/01_ft_printf/ft_printf_bonus/*.h)

# Header of gnl
HEAD_GNL =		$(shell ls librarys/gnl_for_bmlib/src/*.h)

# Git submodule update
GSU =			git submodule update

# Flags for GSU
GSU_FLAGS =		--remote --merge --recursive

# Variable to compile .c files
GCC =			gcc

# Flags for the gcc compilation
FLAGS =			-Wall -Werror -Wextra

# Library compilation
AR =			ar -rcs

# Remove variable
RM =			rm -f

# Colors
DEF_COLOR =		\033[0;39m
GRAY =			\033[0;90m
RED =			\033[0;91m
GREEN =			\033[0;92m
YELLOW =		\033[0;93m
BLUE =			\033[0;94m
MAGENTA =		\033[0;95m
CYAN =			\033[0;96m
WHITE =			\033[0;97m
BLACK =			\033[0;99m
ORANGE =		\033[38;5;209m
BROWN =			\033[38;5;94m
DARK_GRAY =		\033[38;5;234m
MID_GRAY =		\033[38;5;245m
RANDM =			\033[38;5;95m
DARK_GREEN =	\033[38;5;64m
DARK_YELLOW =	\033[38;5;143m

# --------------------------------- ACTIONS ---------------------------------- #

# Main action of the makefile, checks for submodules updates and makes bmlib
all:
				@$(MAKE) update
				@$(MAKE) $(NAME)

update:
#				git submodule update --init
				$(GSU) $(GSU_FLAGS)

# Compiles all the .c files of libft
librarys/00_libft/%.o : librarys/00_libft/%.c $(HEAD_LIB) $(BMLIB)
				@echo "$(BROWN)compiling: [$(DARK_GRAY)$<$(BROWN)]"
				@$(GCC) $(FLAGS) -c $< -o $@

# Compiles all the .c files of ft_printf
librarys/01_ft_printf/ft_printf_bonus/%.o : librarys/01_ft_printf/ft_printf_bonus/%.c $(HEAD_PRF) $(BMLIB)
				@echo "$(BROWN)compiling: [$(DARK_GRAY)$<$(BROWN)]"
				@$(GCC) $(FLAGS) -c $< -o $@

# Compiles all the .c files of gnl
librarys/gnl_for_bmlib/src/%.o : librarys/gnl_for_bmlib/src/%.c $(HEAD_GNL) $(BMLIB)
				@echo "$(BROWN)compiling: [$(DARK_GRAY)$<$(BROWN)]"
				@$(GCC) $(FLAGS) -c $< -o $@

# Clean all the .o files
clean:
				@$(RM) $(OBJS_LIB)
				@$(RM) $(OBJS_PRI)
				@$(RM) $(OBJS_GNL)

# Clean all the .o files and the bmlib.a
fclean:
				@$(MAKE) clean
				@$(RM) $(NAME)

# Clean all the .o files and the bmlib.a, and then restarts to the main action
re:
				@$(MAKE) fclean
				@$(MAKE) all

# Link action
$(NAME)::		$(OBJS_LIB) $(OBJS_PRI) $(OBJS_GNL)
				@echo "$(BROWN)---------------------------------"
				@echo "$(DARK_YELLOW)Linking...$(DEF_COLOR)"
				@$(AR) $@ $^
$(NAME)::
				@echo "$(DARK_GREEN)COMPILED$(DEF_COLOR)"


# Action names
.PHONY:			all update  clean fclean re bmlib.a