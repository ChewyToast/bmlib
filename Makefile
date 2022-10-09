# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/12 09:32:53 by marvin            #+#    #+#              #
#    Updated: 2022/10/07 22:19:41 by bmoll-pe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -------------------------- DECLARATION --------------------------

# Lib name
NAME =			bmlib.a

NAM =			bmlibb.a
# Header for lib
INCL = 			bmlib.h

SRC_LIB =		$(shell ls librarys/00_libft/*.c)

SRC_PRI = 		$(shell ls librarys/01_ft_printf/ft_printf_bonus/*.c)

SRC_GNL =		$(shell ls librarys/gnl_for_bmlib/src/*.c)

LIBFT =			librarys/00_libft/libft.a

PRINTF =		librarys/01_ft_printf/libftprintf.a

GNL =			librarys/gnl_for_bmlib/gnl.a

CMP =			$(shell ls obj/*.o)

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
BLACK =			\033[0;99m

# -------------------------- ACTIONS --------------------------

all::
		@echo "$(YELLOW)UPDATING GIT SUBMODULES... ⌛$(GRAY)"
		@git submodule update --remote --merge --recursive

all::
		@echo "$(BLACK)COMPILATION:"
		@$(MAKE) $(NAME)

$(NAME):: $(ALL_OBJ)
		@echo "$(YELLOW)\nLinking...$(GRAY)"
		@ar -rcs $(NAME) $(ALL_OBJ)

$(NAME)::
		@echo "$(GREEN)\n🌐 BMLIB COMPILED 🌐"

$(NAM):: $(LIBFT)
		ar -x $(LIBFT)
		mv *.o obj/

$(NAM):: $(PRINTF)
		ar -x $(PRINTF)
		mv *.o obj/

$(NAM):: $(GNL)
		ar -x $(GNL)
		mv *.o obj/

$(NAM):: $(LIBFT) $(PRINTF) $(GNL)
		ar -rcs $(NAM) $(CMP)

$(LIBFT):
		@$(MAKE) -C librarys/00_libft

$(PRINTF):
		@$(MAKE) -C librarys/01_ft_printf

$(GNL):
		@$(MAKE) -C librarys/gnl_for_bmlib

$()

%.o: %.c 
		@echo "$(BLUE)compiling $(GRAY) $<"
		@$(CC) $(FLAGS) -c $< -o $@

the:
		$(MAKE) $(NAM)

bm:
		@$(MAKE) $(NAME)

clean:
		@echo "$(MAGENTA)CLEANING ALL THE OBJECTS🧹"
		@rm -f $(ALL_OBJ)

fclean:
		@$(MAKE) clean
		@echo "$(GRAY)&& "
		@echo "$(RED)BMLIB.A REMOVED❌$(GRAY)"
		@rm -f	$(NAME)

fcleanlibs:
		@$(MAKE) fclean -C librarys/00_libft
		@$(MAKE) fclean -C librarys/01_ft_printf
		@$(MAKE) fclean -C librarys/gnl_for_bmlib

re:		fclean all

rebm:
		@$(MAKE) fclean
		@$(MAKE) bm

.PHONY:		all clean fclean re rebm the
