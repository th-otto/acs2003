/******************************************************************************/
/*                                                                            */
/*    ACS               Application Construction System                       */
/*    DESCRIPTION:      Stack management                                      */
/*                                                                            */
/* (c) 1991-2004 Stefan Bachert, Oliver Michalak, Martin Elsaesser            */
/* (c) 2022 Thorsten Otto                                                     */
/******************************************************************************/

#include "acs_i.h"
#include "../memory.h"

static boolean As_push(Stack *stack, void *elem);
static void *As_pop(Stack *stack);
static boolean As_isEmpty(Stack *stack);
static int32 As_count(Stack *stack);
static void As_clear(Stack *stack);

static Stack empty_stack = {
	NULL,
	Ax_free,
	As_push,
	As_pop,
	As_isEmpty,
	As_count,
	As_clear
};

/******************************************************************************/
/* -------------------------------------------------------------------------- */
/******************************************************************************/

Stack *As_create(void)
{
	Stack *stack;
	
	stack = Ax_malloc(sizeof(*stack));
	if (stack == NULL)
		return NULL;
	memcpy(stack, &empty_stack, sizeof(*stack));
	stack->StackData = NULL;
	return stack;
}

/* -------------------------------------------------------------------------- */

void As_delete(Stack *stack)
{
	if (stack != NULL)
	{
		stack->clear(stack);
		Ax_recycle(stack, sizeof(*stack));
	}
}

/* -------------------------------------------------------------------------- */

static void As_clear(Stack *stack)
{
	void *data;
	
	while (!stack->isEmpty(stack))
	{
		data = stack->pop(stack);
		if (stack->freeElem != NULL)
			stack->freeElem(data);
	}
}

/* -------------------------------------------------------------------------- */

static boolean As_push(Stack *stack, void *data)
{
	StackElem *elem = NULL;
	
	elem = Ax_malloc(sizeof(*elem));
	if (elem == NULL)
		return FALSE;
	elem->data = data;
	elem->next = stack->StackData;
	stack->StackData = elem;
	return TRUE;
}

/* -------------------------------------------------------------------------- */

static void *As_pop(Stack *stack)
{
	StackElem *elem = NULL;
	void *data = NULL;
	
	if (stack->StackData != NULL)
	{
		elem = stack->StackData;
		stack->StackData = stack->StackData->next;
		data = elem->data;
		Ax_recycle(elem, sizeof(*elem));
	}
	return data;
}

/* -------------------------------------------------------------------------- */

static boolean As_isEmpty(Stack *stack)
{
#if WITH_FIXES
	return stack->StackData == NULL;
#else
	return stack->StackData != NULL;
#endif
}

/* -------------------------------------------------------------------------- */

static int32 As_count(Stack *stack)
{
	int32 i;
	StackElem *ptr;
	
	for (i = 0, ptr = stack->StackData; ptr != NULL; ptr = ptr->next)
		i++;
	return i;
}
