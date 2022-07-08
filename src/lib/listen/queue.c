/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Queue management                                      */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "../memory.h"

static boolean Aqu_put(Queue *queue, void *data);
static void *Aqu_get(Queue *queue);
static boolean Aqu_isEmpty(Queue *queue);
static int32 Aqu_count(Queue *queue);
static void Aqu_clear(Queue *queue);

static Queue empty_queue = {
	NULL,
	Ax_free,
	Aqu_put,
	Aqu_get,
	Aqu_isEmpty,
	Aqu_count,
	Aqu_clear
};

typedef struct {
	QueueElem *first;
	QueueElem *last;
} QueueData;

static void InitQueue(QueueData *data);

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Queue *Aqu_create(void)
{
	Queue *queue;
	QueueData *data;
	
	queue = Ax_malloc(sizeof(*queue));
	if (queue == NULL)
		return NULL;
	memcpy(queue, &empty_queue, sizeof(*queue));
	data = Ax_malloc(sizeof(*data));
	if (data == NULL)
	{
		Ax_recycle(queue, sizeof(*queue));
		return NULL;
	}
	InitQueue(data);
	queue->QueueData = data;
	return queue;
}

/* -------------------------------------------------------------------------- */

void Aqu_delete(Queue *queue)
{
	if (queue != NULL)
	{
		queue->clear(queue);
#if WITH_FIXES
		Ax_free(queue->QueueData);
#endif
		Ax_recycle(queue, sizeof(*queue));
	}
}

/* -------------------------------------------------------------------------- */

static void InitQueue(QueueData *data)
{
	data->first = NULL;
	data->last = NULL;
}

/* -------------------------------------------------------------------------- */

static void Aqu_clear(Queue *queue)
{
	void *data;
	
	while (!queue->isEmpty(queue))
	{
		data = queue->get(queue);
		if (queue->freeElem != NULL)
			queue->freeElem(data);
	}
}

/* -------------------------------------------------------------------------- */

static boolean Aqu_put(Queue *queue, void *data)
{
	QueueData *qdata = queue->QueueData;
	QueueElem *elem = NULL;
	
	elem = Ax_malloc(sizeof(*elem));
	if (elem == NULL)
		return FALSE;
	elem->data = data;
#if WITH_FIXES
	elem->next = NULL;
	if (qdata->last != NULL)
		qdata->last->next = elem;
	else
		qdata->first = elem;
	qdata->last = elem;
#else
	elem->next = qdata->first;
	qdata->first = elem;
	if (qdata->last == NULL)
		qdata->last = elem;
#endif
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void *Aqu_get(Queue *queue)
{
	QueueData *qdata = queue->QueueData;
	QueueElem *ptr = NULL;
	void *data = NULL;
	
#if WITH_FIXES
	if (qdata->first != NULL)
	{
		ptr = qdata->first;
		qdata->first = qdata->first->next;
		if (qdata->first == NULL)
			qdata->last = NULL;
		data = ptr->data;
		free(ptr);
	}
#else
	if (!queue->isEmpty(queue))
	{
		ptr = qdata->first;
		qdata->first = qdata->first->next;
		if (ptr == qdata->last)
		{
			if (qdata->first == NULL)
			{
				qdata->last = NULL;
			} else
			{
				qdata->last = qdata->first;
				while (qdata->last->next != NULL)
					qdata->last = qdata->last->next;
			}
		}
		data = ptr->data;
		Ax_recycle(ptr, sizeof(*ptr));
	}
#endif
	return data;
}

/* -------------------------------------------------------------------------- */

static boolean Aqu_isEmpty(Queue *queue)
{
#if WITH_FIXES
	return ((QueueData *)queue->QueueData)->first == NULL;
#else
	return ((QueueData *)queue->QueueData)->first != NULL;
#endif
}

/* -------------------------------------------------------------------------- */

static int32 Aqu_count(Queue *queue)
{
	int32 i;
	QueueElem *ptr;
	
	for (i = 0, ptr = ((QueueData *)queue->QueueData)->first; ptr != NULL; ptr = ptr->next)
		i++;
	return i;
}
