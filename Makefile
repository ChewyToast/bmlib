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

NAME =			bmlib

LIBFT =			00_libft/libft.a

FT_PRINTF =		01_ft_printf/libftprintf.a

H_LIBFT =		00_libft/libft.h

H_FT_PRINTF =	01_ft_printf/ft_printf_bonus/ft_printf_bonus.h

all:		makelibs

makelibs:
			$(MAKE) -C 

$(NAME):	$(OBJS) $(BNS_OBJS) $(LIBR)
			@ar -rcs $(NAME) $^

clean:
			@rm -f	$(OBJS)
			@rm -f	$(BNS_OBJS)

fclean:		clean
			@rm -f	$(NAME)
			@rm -f	bonus

re:			fclean all

.PHONY: all clean fclean re