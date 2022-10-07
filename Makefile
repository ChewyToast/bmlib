# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/12 09:32:53 by marvin            #+#    #+#              #
#    Updated: 2022/05/27 22:37:09 by bmoll-pe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -------------------------- DECLARATION --------------------------

# Lib name
NAME =			bmlib.a

# Header for lib
INCL = 			bmlib.h

SRC_LIB =		$(shell ls librarys/00_libft/*.c)

SRC_PRI = 		$(shell ls librarys/01_ft_printf/ft_printf_bonus/*.c)

SRC_GNL =		$(shell ls librarys/gnl_for_bmlib/src/*.c)

OBJS_LIB =		$(SRC_LIB:.c=.o)

OBJS_PRI =		$(SRC_PRI:.c=.o)

OBJS_GNL =		$(SRC_GNL:.c=.o)

ALL_OBJ = 		$(OBJS_LIB) $(OBJS_PRI) $(OBJS_GNL)

FLAGS =		-Werror -Wextra -Wall

CC = 		gcc

# Path for the subMakefiles
MAKE_LIB =		librarys/00_libft/

MAKE_PRINTF =	librarys/01_ft_printf/

MAKE_GNL = 		librarys/gnl_for_bmlib/

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

# -------------------------- ACTIONS --------------------------

all:
		@echo "$(YELLOW)\n\n\t\t\t\t\t\t⭐ PREPARING TO COMPILE BMLIB ⭐\n\n\n"
		@echo "$(CYAN) UPDATING GIT SUBMODULES... ⌛$(GREEN)"
		@git submodule update --remote --merge --recursive
		@echo "\n"
		@$(MAKE) $(NAME)

bm:
		@$(MAKE) $(NAME)

$(NAME): $(ALL_OBJ)
		@echo "$(YELLOW)\n\nLinking...$(GRAY)"
		@ar -rcs $(NAME) $(ALL_OBJ)
		@echo "$(YELLOW)\n-=-=-=-=-=-=-=-=-=- $(WHITE)🌐 BMLIB COMPILED SUCCESSFULLY 🌐 $(YELLOW)-=-=-=-=-=-=-=-=-=-"
#		@echo "$(YELLOW)\t\t\t\t\t\t   ---------------------------"
#		@echo "$(GREEN)\n\t\t\t\t\t\t🌐 BMLIB COMPILED SUCCESSFULLY 🌐$(DEF_COLOR)\n"
#		@echo "$(YELLOW)\t\t\t\t\t\t   ---------------------------\n"

%.o: %.c 
	@echo "$(BLUE)compiling $< $(GRAY)"
	$(CC) $(FLAGS) -c $< -o $@
	@echo "$(CYAN)--------------------------------------------------------------"

clean:
		@echo "$(MAGENTA)\n 🧹CLEANING ALL THE OBJECTS🧹\n"
		@rm -f $(ALL_OBJ)

fclean:
		@$(MAKE) clean
		@echo "\t$(GRAY)     AND"
		@echo "$(RED)\n     ❌BMLIB.A REMOVED❌\n$(GRAY)"
		@rm -f	$(NAME)

re:		fclean all


.PHONY:		all clean fclean re