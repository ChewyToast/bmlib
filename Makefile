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

# Libr name
NAME =			bmlib

# Source files
SRC =			$(wildcard *.c)

# All the objects (compiled files)
OBJ =			$(SRC:.c=.o)

# Headers files
H_LIBFT =		$(wildcard *.h)

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

# Compile files and make obj
%.o:		%.c
			@echo "$(BLUE) compiling $<"
			@echo "$(GRAY)"
			$(CC) $(FLAGS) -c $< -o $@
			@echo "$(CYAN)----------------------------------------"

# Link objects and make the library
$(NAME):	$(OBJ) $(LIBR)
			@ar -rcs $(NAME) $(OBJ)

all:		$(NAME)

clean:
			@rm -f	$(OBJ)

fclean:		clean
			@rm -f	$(NAME)

re:			fclean all

.PHONY:		all clean fclean re