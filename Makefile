# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ytouate <ytouate@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/22 11:23:28 by ytouate           #+#    #+#              #
#    Updated: 2022/08/08 15:35:48 by ytouate          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = cub3D

CC = gcc -fsanitize=address -g

CFLAGS = -Wall -Wextra -Werror

FILES = \
	./cub.c									\
	./debug.c								\
	./get_next_line/get_next_line_utils.c	\
	./get_next_line/get_next_line.c			\
	./map_parse.c							\
	./map_check.c							\
	./drawing_utils.c						\
	./ddaline.c								\

O_FILES = $(FILES:.c=.o)

all: $(NAME)

$(NAME): $(O_FILES)
	cd Libft && make && make bonus && cd ..
	$(CC) $(CFLAGS) ./Libft/libft.a -lmlx -framework OpenGL -framework AppKit $(O_FILES) -o $(NAME)

clean:
	rm -f *.o
	cd Libft && make clean && cd ..

fclean:
	rm -f cub3D
	cd Libft && make fclean && cd ..

re: fclean all

run:
	./cub3D a.cub

libft:
	cd Libft && make && cd ..