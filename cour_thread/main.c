/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vnieto-j <vnieto-j@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/09/05 13:38:10 by vnieto-j          #+#    #+#             */
/*   Updated: 2023/09/05 16:42:50 by vnieto-j         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <pthread.h>
#include <stdio.h>

# define NC "\e[0m"
# define YELLOW "\e[1;33m"

/*
	@brief Fonction qu ele thread invoque apres sa creation
			Le thread se termine a la fin de cette fonction
*/

void	*pthread_routine(void *data)
{
	(void)data;
	pthread_t tid;
	
	//Le fonction pthread_self() renvoie l'id du thread
	tid = pthread_self();
	printf("%sThread [%ld]: Le plus grand ennui c'est d'exister sans vivre. %s\n",
			YELLOW, tid, NC);
	return (NULL);
}

int main(void)
{
	pthread_t	tid1;
	pthread_t	tid2;

	pthread_create(&tid1, NULL, pthread_routine, NULL);
	printf("Main : creation du premier thread [%ld]\n", tid1);
	// Creation du second thread va aussi executer pthread_routine.
	pthread_create(&tid2, NULL, pthread_routine, NULL);
	printf("Creation du second thread [%ld]\n", tid2);
	// Le main thread attend que le nouveau thread se termine avec
	// pthread_join
	pthread_join(tid1, NULL);
	printf("Main : Union du premier thread [%ld]\n", tid1);
	pthread_join(tid2, NULL);
	printf("Main: Union du premier thread [%ld]\n", tid2);
	return (0);	
}