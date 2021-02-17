#include <X11/Xlib.h>
#include "st.h"

#ifndef X
#define X

typedef struct {
    uint mod;
    KeySym keysym;
    void (*func)(const Arg *);
    const Arg arg;
} Shortcut;

typedef struct {
    uint mod;
    uint button;
    void (*func)(const Arg *);
    const Arg arg;
    uint  release;
} MouseShortcut;

typedef struct {
    KeySym k;
    uint mask;
    char *s;
    /* three-valued logic variables: 0 indifferent, 1 on, -1 off */
    signed char appkey;    /* application keypad */
    signed char appcursor; /* application cursor */
} Key;

/* X modifiers */
#define XK_ANY_MOD    UINT_MAX
#define XK_NO_MOD     0
#define XK_SWITCH_MOD (1<<13)

/* function definitions used in config.h */
static void clipcopy(const Arg *);
static void clippaste(const Arg *);
static void numlock(const Arg *);
static void selpaste(const Arg *);
static void zoom(const Arg *);
static void zoomabs(const Arg *);
static void zoomreset(const Arg *);
static void ttysend(const Arg *);


#endif /* !X */

