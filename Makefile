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

# .a files
LIBFT =			librarys/00_libft/libft.a

PRINTF =		librarys/01_ft_printf/libftprintf.a

GNL = 			librarys/gnl_for_bmlib/gnl.a

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
		$(MAKE) sub
		$(MAKE) $(NAME)

sub:
		git submodule update --init --recursive
		@$(MAKE) -C $(MAKE_LIB)
		@$(MAKE) -C $(MAKE_PRINTF)
		@$(MAKE) -C $(MAKE_GNL)

$(NAME): $(LIBFT) $(PRINTF) $(GNL)
		ar -rcs $(NAME) $(LIBFT) $(PRINTF) $(GNL)

clean:
		make clean -C $(MAKE_LIB)
		make clean -C $(MAKE_PRINTF)
		make clean -C $(MAKE_GNL)

fclean:
		$(MAKE) clean
		make fclean -C $(MAKE_LIB)
		make fclean -C $(MAKE_PRINTF)
		make fclean -C $(MAKE_GNL)
		@rm -f	$(NAME)

re:		fclean all


.PHONY:		all clean fclean re sub