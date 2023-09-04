################################################################################
#								    COLOR									   #
################################################################################

#Formatage du texte
BOLD =	\033[1m
UNDERLINE =	\033[4m
SIGNAL = \033[5m
HIGHTLIGHT = \033[7m

#Couleur du texte
BLACK = \033[030m
RED = \033[031m
GREEN = \033[032m
ORANGE = \033[033m
BLUE = \033[034m
MAGENTA = \033[035m
CYAN = \033[036m
WHITE = \033[047m
LIGHT_RED = \033[91m
LIGHT_GREEN = \033[92m
LIGHT_CYAN = \033[96m

#Couleur arriere plan
BBLACK = \033[040m
BRED = \033[041m
BGREEN = \033[042m
BORANGE = \033[043m
BBLUE = \033[044m
BMAGENTA = \033[045m
BCYAN = \033[046m
BWHITE = \033[047m

#Reset
RESET =	\033[0m

################################################################################
#								    CONFIG									   #
################################################################################

NAME	=	MonTest

INC_DIR	=	./include/

CC	=	cc 

CFLAGS	=	-g -Wall -Wextra -Werror -I$(INC_DIR)

RM	=	rm -rf

AUTHOR	=	vnieto-j

LIBFT_PATH = ./libft

LIBS = -L./libft

################################################################################
#                                 PROGRAM'S SRCSS                               #
################################################################################


SRC_DIR =	./src/

# On attribuer a la variable SRCS tout les fichier .c dans ./src

SRCS =	$(wildcard $(SRC_DIR)*.c)

# Tranforme les fichiers .c en .o dans chaque fichier de SRCS

OBJS =	$(SRCS:%.c=%.o)

%.o: %.c
	@$(CC) $(CFLAGS) -o $@ -c $<

################################################################################
#                             		 NAME                                      #
################################################################################

$(NAME): init $(OBJS) $(INC_DIR)test.h $(LIBFT_PATH)/libft.a
	@make -s -C ./libft
	@printf "\t$(BOLD)$(BMAGENTA)Compilation des fichiers .c de $(NAME)$(RESET)\n\n"
	@$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(LIBS) -lft $(LDFLAGS)
	@printf "$(BOLD)$(LIGHT_GREEN)$(NAME) : $(LIGHT_CYAN)compiled$(LIGHT_GREEN)$(RESET)\n"
	@printf "$(BOLD)$(LIGHT_GREEN)Executable de $(NAME) :$(BOLD) $(LIGHT_CYAN)created$(RESET)\n\n"

all : $(NAME)

init: 
	@printf "\t\t\t$(BOLD)$(BBLUE)Initialisation $(RESET)\n\n"
	@printf "\t$(BOLD)$(BMAGENTA)Execution de make dans $(LIBFT_PATH)$(RESET)\n\n"
	@make -s -C $(LIBFT_PATH)

clean :
	@make -s -C $(LIBFT_PATH) clean 
	@$(RM) $(OBJS)

fclean : clean
	@make -s -C ./libft fclean
	@$(RM) $(NAME) $(OBJS)

re :
	@make -s -C /libft re
	@make fclean
	@make all

.PHONY: all clean fclean re