#ifndef BMLIB_H
# define BMLIB_H

// LIBRARY FOR WRITE()
# include <unistd.h>

// LIBRARY FOR SIZE_T
# include <stddef.h>

// LIBRARY FOR MALLOC()
# include <stdlib.h>

// LIBRARY FOR VA_ARG()
# include <stdarg.h>

//-------------------LIBFT--------------------
typedef struct s_list
{
	void			*content;
	struct s_list	*next;
}	t_list;


int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_toupper(int c);
int		ft_tolower(int c);
int		ft_strncmp(const char *s1, const char *s2, size_t n);
int		ft_memcmp(const void *s1, const void *s2, size_t n);
int		ft_atoi(const char *nptr);
int		ft_lstsize(t_list *lst);

char	*ft_strchr(const char *s, int c);
char	*ft_strrchr(const char *s, int c);
char	*ft_strnstr(const char *big, const char *little, size_t len);
char	*ft_strdup(const char *s);
char	*ft_substr(char const *s, unsigned int start, size_t len);
char	*ft_strjoin(char const *s1, char const *s2);
char	*ft_strtrim(char const *s1, char const *set);
char	*ft_itoa(int n);
char	**ft_split(char const *s, char c);
char	*ft_strmapi(char const *s, char (*f)(unsigned int, char));

void	*ft_memset(void *s, int c, size_t n);
void	*ft_memcpy(void *dest, const void *src, size_t n);
void	*ft_memmove(void *dest, const void *src, size_t n);
void	*ft_memchr(const void *s, int c, size_t n);
void	*ft_calloc(size_t nmemb, size_t size);
void	ft_bzero(void *s, size_t n);
void	ft_striteri(char *s, void (*f)(unsigned int, char*));
void	ft_putchar_fd(char c, int fd);
void	ft_putstr_fd(char *s, int fd);
void	ft_putendl_fd(char *s, int fd);
void	ft_putnbr_fd(int n, int fd);
void	ft_lstadd_front(t_list **lst, t_list *nes);
void	ft_lstadd_back(t_list **lst, t_list *nlst);
void	ft_lstdelone(t_list *lst, void (*del)(void*));
void	ft_lstclear(t_list **lst, void (*del)(void*));
void	ft_lstiter(t_list *lst, void (*f)(void *));

size_t	ft_strlcpy(char *dst, const char *src, size_t size);
size_t	ft_strlcat(char *dst, const char *src, size_t size);
size_t	ft_strlen(const char *s);
size_t	ft_strspn(const char *s, const char *accept);
size_t	ft_strrspn(const char *s, const char *accept);

t_list	*ft_lstnew(void *content);
t_list	*ft_lstlast(t_list *lst);
t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *));

//-------------------FT_PRINTF--------------------

int		ft_printf(const char *inp_str, ...);
ssize_t	ft_read(const char *str, va_list args);

ssize_t	ft_ptoa(unsigned long long int n);
ssize_t	ft_itoaa(int n, int space, int sign);
ssize_t	ft_uitoa(unsigned int n);
ssize_t	ft_10to16(unsigned int n, int mode, int flag);

ssize_t	ft_putcharr(char c);
ssize_t	ft_putstrr(const char *str);
int		a_conver_i(const char *nptr);

#endif